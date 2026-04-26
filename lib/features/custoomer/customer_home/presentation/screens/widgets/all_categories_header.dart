import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/all_categories_stats_row.dart';

class AllCategoriesHeader extends StatelessWidget {
  const AllCategoriesHeader({
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
        gradient: const LinearGradient(
          colors: <Color>[Color(0xFF1A72C8), Color(0xFF0989D8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: context.pop,
                child: Container(
                  width: 34.w,
                  height: 34.w,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 14.sp,
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                Icons.water_drop_rounded,
                color: Colors.white.withValues(alpha: 0.9),
                size: 20.sp,
              ),
            ],
          ),
          verticalSpacing(6),
          AppText(
            'WaterRush',
            style: font10w500.copyWith(
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ),
          verticalSpacing(1),
          AppText(
            'All Categories',
            style: font22w700.copyWith(color: Colors.white, height: 1),
          ),
          verticalSpacing(12),
          AllCategoriesStatsRow(
            categoriesCount: categoriesCount,
            totalProductsCount: totalProductsCount,
            onOfferCount: onOfferCount,
          ),
        ],
      ),
    );
  }
}
