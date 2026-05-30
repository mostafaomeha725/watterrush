import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class AuthRoleOptionContent extends StatelessWidget {
  const AuthRoleOptionContent({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.iconCircleColor,
    this.iconColor,
    this.titleColor,
    this.subtitleColor,
    this.trailingCircleColor,
    this.trailingIconColor,
    super.key,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color? iconCircleColor;
  final Color? iconColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? trailingCircleColor;
  final Color? trailingIconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 52.w,
          height: 52.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconCircleColor ?? const Color(0xFF3AB9F7),
          ),
          child: Icon(
            icon,
            color: iconColor ?? AppLightColors.white,
            size: 28.sp,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title,
                style: font18w700.copyWith(
                  color: titleColor ?? const Color(0xFF194197),
                ),
              ),
              SizedBox(height: 4.h),
              AppText(
                subtitle,
                style: font14w400.copyWith(
                  color: subtitleColor ?? const Color(0xFF5F7287),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 38.w,
          height: 38.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: trailingCircleColor ?? const Color(0xFFFFFFFF),
          ),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: trailingIconColor ?? const Color(0xFF157FFF),
            size: 18.sp,
          ),
        ),
      ],
    );
  }
}