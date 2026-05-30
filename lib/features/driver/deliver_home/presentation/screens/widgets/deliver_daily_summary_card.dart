import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';

class DeliverDailySummaryCard extends StatelessWidget {
  const DeliverDailySummaryCard({super.key, required this.summary});

  final DeliverDailySummaryModel summary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF1464D8).withValues(alpha: 0.06),
            blurRadius: 16.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 42.w,
            height: 42.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: summary.isSuccess
                    ? <Color>[const Color(0xFFCEF2E0), const Color(0xFFB0E8CA)]
                    : <Color>[const Color(0xFFFFDDE5), const Color(0xFFFFCCD6)],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              summary.isSuccess ? Icons.check_rounded : Icons.close_rounded,
              color: summary.isSuccess
                  ? const Color(0xFF0FA860)
                  : const Color(0xFFD93060),
              size: 22.sp,
            ),
          ),
          horizontalSpacing(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppText(
                  summary.customerName,
                  style: font16w600.copyWith(color: const Color(0xFF0D2040)),
                ),
                if (summary.reason != null) ...<Widget>[
                  verticalSpacing(2),
                  AppText(
                    summary.reason!,
                    style: font10w500.copyWith(color: const Color(0xFFCC3B5A)),
                  ),
                ],
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: summary.isSuccess
                  ? const Color(0xFFE4F8EE)
                  : const Color(0xFFFFEAEE),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: AppText(
              summary.value,
              style: font14w700.copyWith(
                color: summary.isSuccess
                    ? const Color(0xFF0FA860)
                    : const Color(0xFFD63060),
              ),
            ),
          ),
        ],
      ),
    );
  }
}