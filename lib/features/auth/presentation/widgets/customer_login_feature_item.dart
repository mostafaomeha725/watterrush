import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CustomerLoginFeatureItem extends StatelessWidget {
  const CustomerLoginFeatureItem({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.showDivider = true,
    super.key,
  });

  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
          child: Row(
            children: [
              Container(
                width: 42.w,
                height: 42.w,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 22.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title,
                      style: font18w700.copyWith(
                        color: const Color(0xFF1D3C71),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    AppText(
                      subtitle,
                      style: font12w500.copyWith(
                        color: const Color(0xFF7B8EAA),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: const Color(0xFF4A9EFF),
                size: 20.sp,
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider(height: 1.h, thickness: 1.h, color: const Color(0xFFE6EDF7)),
      ],
    );
  }
}