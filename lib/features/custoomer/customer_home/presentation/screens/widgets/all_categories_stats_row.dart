import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class AllCategoriesStatsRow extends StatelessWidget {
  const AllCategoriesStatsRow({
    super.key,
    required this.categoriesCount,
    required this.totalProductsCount,
    required this.onOfferCount,
  });

  final int categoriesCount;
  final int totalProductsCount;
  final int onOfferCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0x22FFFFFF),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppText(
                  '$categoriesCount',
                  style: font24w700.copyWith(color: Colors.white),
                ),
                verticalSpacing(2),
                AppText(
                  'Categories',
                  style: font10w500.copyWith(color: const Color(0xD4E6F4FF)),
                ),
              ],
            ),
          ),
        ),
        horizontalSpacing(8),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0x22FFFFFF),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppText(
                  '$totalProductsCount',
                  style: font24w700.copyWith(color: Colors.white),
                ),
                verticalSpacing(2),
                AppText(
                  'Total Products',
                  style: font10w500.copyWith(color: const Color(0xD4E6F4FF)),
                ),
              ],
            ),
          ),
        ),
        horizontalSpacing(8),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0x22FFFFFF),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppText(
                  '$onOfferCount',
                  style: font24w700.copyWith(color: Colors.white),
                ),
                verticalSpacing(2),
                AppText(
                  'On Offer',
                  style: font10w500.copyWith(color: const Color(0xD4E6F4FF)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}