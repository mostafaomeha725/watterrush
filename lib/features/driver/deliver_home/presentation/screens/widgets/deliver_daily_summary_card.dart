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
        border: Border.all(color: const Color(0xFFDDE5F2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: summary.isSuccess
                  ? const Color(0xFFE0F5EB)
                  : const Color(0xFFFFEEF1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              summary.isSuccess ? Icons.check_rounded : Icons.close_rounded,
              color: summary.isSuccess
                  ? const Color(0xFF2DB370)
                  : const Color(0xFFEE4D73),
              size: 22.sp,
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppText(
                  summary.customerName,
                  style: font16w600.copyWith(color: const Color(0xFF102A43)),
                ),
                if (summary.reason != null) ...<Widget>[
                  verticalSpacing(2),
                  AppText(
                    summary.reason!,
                    style: font10w500.copyWith(color: const Color(0xFFE15454)),
                  ),
                ],
              ],
            ),
          ),
          AppText(
            summary.value,
            style: font14w700.copyWith(
              color: summary.isSuccess
                  ? const Color(0xFF08B66A)
                  : const Color(0xFFE93030),
            ),
          ),
        ],
      ),
    );
  }
}
