import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/special_offers_stats_bar.dart';

class SpecialOffersHeader extends StatelessWidget {
  const SpecialOffersHeader({
    super.key,
    required this.activeDealsCount,
    required this.maxDiscount,
  });

  final int activeDealsCount;
  final int maxDiscount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFECF1F8))),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: context.pop,
                    child: Container(
                      width: 38.w,
                      height: 38.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F5FF),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: const Color(0xFFDDE6F7)),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: const Color(0xFF1A3F6F),
                        size: 16.sp,
                      ),
                    ),
                  ),
                  horizontalSpacing(14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppText(
                        'WaterRush',
                        style: font10w500.copyWith(
                          color: const Color(0xFF1E73D9),
                          letterSpacing: 0.6,
                        ),
                      ),
                      AppText(
                        'Special Offers',
                        style: font20w800.copyWith(
                          color: const Color(0xFF0F2D52),
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 7.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: <Color>[Color(0xFF1E73D9), Color(0xFF0B9CDB)],
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.local_fire_department_rounded,
                          size: 14.sp,
                          color: const Color(0xFFFFC542),
                        ),
                        horizontalSpacing(5),
                        AppText(
                          '$activeDealsCount Deals',
                          style: font12w700.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpacing(16),
              SpecialOffersStatsBar(
                activeDealsCount: activeDealsCount,
                maxDiscount: maxDiscount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
