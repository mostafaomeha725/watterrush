import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class SpecialOffersStatsRow extends StatelessWidget {
  const SpecialOffersStatsRow({
    super.key,
    required this.activeDealsCount,
    required this.maxDiscount,
  });

  final int activeDealsCount;
  final int maxDiscount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0x2EFFFFFF),
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.45),
                width: 1.1,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFF0A4F9A).withValues(alpha: 0.22),
                  blurRadius: 10.r,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.bolt_rounded,
                      size: 14.sp,
                      color: const Color(0xFFFFC542),
                    ),
                    horizontalSpacing(6),
                    AppText(
                      '$activeDealsCount Active Deals',
                      style: font14w700.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                verticalSpacing(3),
                AppText(
                  'Grab them before they expire',
                  style: font10w500.copyWith(color: const Color(0xFFD6E9FF)),
                ),
              ],
            ),
          ),
        ),
        horizontalSpacing(10),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0x2EFFFFFF),
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.45),
                width: 1.1,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFF0A4F9A).withValues(alpha: 0.22),
                  blurRadius: 10.r,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.sell_outlined,
                      size: 14.sp,
                      color: const Color(0xFFB5FFE6),
                    ),
                    horizontalSpacing(6),
                    AppText(
                      'Up to $maxDiscount% OFF',
                      style: font14w700.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                verticalSpacing(3),
                AppText(
                  'On selected products',
                  style: font10w500.copyWith(color: const Color(0xFFD6E9FF)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}