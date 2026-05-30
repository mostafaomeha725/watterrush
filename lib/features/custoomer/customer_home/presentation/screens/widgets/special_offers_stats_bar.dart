import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class SpecialOffersStatsBar extends StatelessWidget {
  const SpecialOffersStatsBar({
    super.key,
    required this.activeDealsCount,
    required this.maxDiscount,
  });

  final int activeDealsCount;
  final int maxDiscount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FF),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFD1E5FF)),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.bolt_rounded,
            size: 18.sp,
            color: const Color(0xFF1E73D9),
          ),
          horizontalSpacing(8),
          Expanded(
            child: AppText(
              'Save up to $maxDiscount% on $activeDealsCount active deals — limited time only!',
              style: font12w500.copyWith(color: const Color(0xFF2A5080)),
              maxLines: 2,
            ),
          ),
          horizontalSpacing(8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: const Color(0xFFFF4444),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: AppText(
              'UP TO $maxDiscount% OFF',
              style: font10w700.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}