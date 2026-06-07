import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class StatsItemDriverLogin extends StatelessWidget {
  const StatsItemDriverLogin({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.valueColor,
    this.valueTrailingIcon,
    this.valueTrailingIconColor,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final Color valueColor;
  final IconData? valueTrailingIcon;
  final Color? valueTrailingIconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: iconColor, size: 22.sp),
        SizedBox(height: 7.h),
        AppText(
          title,
          alignment: AlignmentDirectional.center,
          style: font14w700.copyWith(color: const Color(0xFF4A6287)),
        ),
        SizedBox(height: 6.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              value,
              alignment: AlignmentDirectional.center,
              style: font22w700.copyWith(color: valueColor),
            ),
            if (valueTrailingIcon != null) ...[
              SizedBox(width: 2.w),
              Icon(
                valueTrailingIcon,
                size: 24.sp,
                color: valueTrailingIconColor ?? iconColor,
              ),
            ],
          ],
        ),
      ],
    );
  }
}
