import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class DriverProfileStatItemCard extends StatelessWidget {
  const DriverProfileStatItemCard({
    super.key,
    required this.icon,
    required this.value,
    required this.title,
    required this.valueColor,
    required this.iconBg,
    required this.iconColor,
  });

  final IconData icon;
  final String value;
  final String title;
  final Color valueColor;
  final Color iconBg;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
              child: Icon(icon, size: 20.sp, color: iconColor),
            ),
            SizedBox(height: 8.h),
            AppText(
              value,
              alignment: AlignmentDirectional.center,
              style: font26w700.copyWith(color: valueColor),
            ),
            SizedBox(height: 2.h),

            AppText(
              title,
              alignment: AlignmentDirectional.center,
              style: font14w500.copyWith(color: const Color(0xFF8FA1B9)),
            ),
          ],
        ),
      ),
    );
  }
}
