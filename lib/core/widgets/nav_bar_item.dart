import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class NavBarItem extends StatelessWidget {
  final String assetPath;
  final String label;
  final int badgeCount;
  final bool isSelected;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.assetPath,
    required this.label,
    this.badgeCount = 0,
    required this.isSelected,
    required this.onTap,
  });

  IconData? resolveIcon() {
    switch (label) {
      case 'Home':
        return Icons.home_filled;
      case 'Subscribe':
        return Icons.card_giftcard_rounded;
      case 'Cart':
        return Icons.shopping_cart_outlined;
      case 'Offers':
        return Icons.local_offer_outlined;
      case 'Profile':
        return Icons.person_outline_rounded;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color activeColor = Color(0xFF1E6EF2),
        inactiveColor = Color(0xFFA3AEC1);
    final IconData? iconData = resolveIcon();

    return BounceIt(
      onPressed: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 2.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFE6F0FF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Center(
                    child: iconData != null
                        ? Icon(
                            iconData,
                            size: 18.sp,
                            color: isSelected ? activeColor : inactiveColor,
                          )
                        : AppAsset(
                            assetName: assetPath,
                            width: 18.w,
                            height: 18.w,
                            color: isSelected ? activeColor : inactiveColor,
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
                if (badgeCount > 0)
                  Positioned(
                    top: -5.h,
                    right: -6.w,
                    child: Container(
                      width: 14.w,
                      height: 14.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1E6EF2),
                        shape: BoxShape.circle,
                      ),
                      child: AppText(
                        '$badgeCount',
                        alignment: AlignmentDirectional.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 7.2.sp,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 3.h),
            AppText(
              label,
              maxLines: 1,
              alignment: AlignmentDirectional.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isSelected ? activeColor : inactiveColor,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                fontSize: 8.5.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
