import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class DriverDeliveryStatusBanner extends StatelessWidget {
  const DriverDeliveryStatusBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.isCash,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool isCash;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0x24FFFFFF),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 52.w,
            height: 52.w,
            decoration: const BoxDecoration(
              color: Color(0x2AFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Icon(icon, color: color, size: 24.sp),
          ),
          horizontalSpacing(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppText(title, style: font18w700.copyWith(color: Colors.white)),
                AppText(
                  subtitle,
                  style: font14w500.copyWith(color: const Color(0xFFE3EDFF)),
                ),
              ],
            ),
          ),
          if (isCash)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0x33F2A007),
                borderRadius: BorderRadius.circular(999.r),
                border: Border.all(color: const Color(0x66F9CD63)),
              ),
              child: AppText(
                'Cash',
                style: font12w700.copyWith(color: const Color(0xFFFFC84A)),
              ),
            ),
        ],
      ),
    );
  }
}
