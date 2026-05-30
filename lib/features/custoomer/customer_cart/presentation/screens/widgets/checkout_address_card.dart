import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CheckoutAddressCard extends StatelessWidget {
  const CheckoutAddressCard({
    super.key,
    required this.title,
    required this.address,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String address;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFDDF4FB) : Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF06A7DB)
                : const Color(0xFFD6DEE8),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18.sp,
              color: isSelected
                  ? const Color(0xFF0AA1CF)
                  : const Color(0xFFA0AABC),
            ),
            horizontalSpacing(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title,
                    style: font18w500.copyWith(color: const Color(0xFF0F2B46)),
                  ),
                  verticalSpacing(2),
                  AppText(
                    address,
                    maxLines: 1,
                    style: font14w400.copyWith(color: const Color(0xFF4F6276)),
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
                  width: 1.4,
                  color: isSelected
                      ? const Color(0xFF0AA1CF)
                      : const Color(0xFFBBC5D2),
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0AA1CF),
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