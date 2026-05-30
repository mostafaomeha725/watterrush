import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';

class CustomerHomeIconAction extends StatelessWidget {
  const CustomerHomeIconAction({
    required this.icon,
    required this.onTap,
    this.badgeCount = 0,
    super.key,
  });

  final IconData icon;
  final VoidCallback onTap;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    return BounceIt(
      onPressed: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFE1EAF7)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFB7C9E2).withValues(alpha: 0.18),
                  blurRadius: 14.r,
                  offset: Offset(0, 6.h),
                ),
              ],
            ),
            child: Icon(icon, color: const Color(0xFF687B9A), size: 18.sp),
          ),
          if (badgeCount > 0)
            Positioned(
              top: -3.h,
              right: -3.w,
              child: Container(
                width: 12.w,
                height: 12.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFF04438),
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}