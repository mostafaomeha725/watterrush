import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CheckoutDeliveryOptionCard extends StatelessWidget {
  const CheckoutDeliveryOptionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFDDF4FB) : Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF06A7DB)
                : const Color(0xFFD6DEE8),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20.sp,
              color: isSelected
                  ? const Color(0xFF0AA1CF)
                  : const Color(0xFF9BA7B8),
            ),
            verticalSpacing(8),
            AppText(
              title,
              maxLines: 1,
              textAlign: TextAlign.center,
              alignment: AlignmentDirectional.center,
              style: font14w700.copyWith(
                color: isSelected
                    ? const Color(0xFF0F2B46)
                    : const Color(0xFF1A2F47),
              ),
            ),
            verticalSpacing(2),
            AppText(
              subtitle,
              maxLines: 1,
              textAlign: TextAlign.center,
              alignment: AlignmentDirectional.center,
              style: font12w400.copyWith(
                color: isSelected
                    ? const Color(0xFF44576E)
                    : const Color(0xFF7A8797),
              ),
            ),
          ],
        ),
      ),
    );
  }
}