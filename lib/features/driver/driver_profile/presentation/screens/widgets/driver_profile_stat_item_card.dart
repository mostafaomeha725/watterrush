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
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 6.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xFF1464D8).withValues(alpha: 0.07),
              blurRadius: 16.r,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
              child: Icon(icon, size: 21.sp, color: iconColor),
            ),
            SizedBox(height: 8.h),
            AppText(
              value,
              alignment: AlignmentDirectional.center,
              style: font24w700.copyWith(
                color: valueColor,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 2.h),
            AppText(
              title,
              alignment: AlignmentDirectional.center,
              style: font12w500.copyWith(color: const Color(0xFF8FA1B9)),
            ),
          ],
        ),
      ),
    );
  }
}