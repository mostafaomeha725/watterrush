import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class PaymentMethodOptionCard extends StatelessWidget {
  const PaymentMethodOptionCard({
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
    final Color borderColor = isSelected
        ? const Color(0xFF0EA5E9)
        : const Color(0xFFD8DEE6);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEAF9FE) : const Color(0xFFF6F7F9),
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(0xFFD0F1FD)
                    : const Color(0xFFE8EAEE),
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? const Color(0xFF078DB7)
                    : const Color(0xFF7F8897),
                size: 22.sp,
              ),
            ),
            horizontalSpacing(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title,
                    style: font16w500.copyWith(color: const Color(0xFF071B33)),
                  ),
                  verticalSpacing(2),
                  AppText(
                    subtitle,
                    style: font12w400.copyWith(color: const Color(0xFF4A6075)),
                  ),
                ],
              ),
            ),
            Container(
              width: 18.w,
              height: 18.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF079CC7)
                      : const Color(0xFFBEC5CF),
                  width: 1.4,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF079CC7),
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
