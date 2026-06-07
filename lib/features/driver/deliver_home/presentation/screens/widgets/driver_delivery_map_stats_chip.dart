import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class DriverDeliveryMapStatsChip extends StatelessWidget {
  const DriverDeliveryMapStatsChip({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
  });

  final String value;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFD5E0F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icon, size: 14.sp, color: const Color(0xFF1E6FD8)),
              SizedBox(width: 4.w),
              AppText(
                value,
                style: font14w700.copyWith(color: const Color(0xFF0D2F63)),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          AppText(
            label,
            style: font10w500.copyWith(color: const Color(0xFF8FA3BF)),
          ),
        ],
      ),
    );
  }
}
