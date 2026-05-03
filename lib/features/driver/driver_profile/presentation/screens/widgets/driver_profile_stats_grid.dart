import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_metric_item.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_models.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_stat_item_card.dart';

class DriverProfileStatsGrid extends StatelessWidget {
  const DriverProfileStatsGrid({super.key, required this.profile});

  final DriverProfileData profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 4.h),
        Row(
          children: <Widget>[
            DriverProfileStatItemCard(
              icon: Icons.local_shipping_rounded,
              value: profile.todayRuns,
              title: 'Today\'s Runs',
              valueColor: const Color(0xFF1464D8),
              iconBg: const Color(0xFFE4EEFF),
              iconColor: const Color(0xFF1464D8),
            ),
            SizedBox(width: 10.w),
            DriverProfileStatItemCard(
              icon: Icons.star_rounded,
              value: profile.todayRating,
              title: 'Rating',
              valueColor: const Color(0xFFCA8800),
              iconBg: const Color(0xFFFAF0D8),
              iconColor: const Color(0xFFCA8800),
            ),
            SizedBox(width: 10.w),
            DriverProfileStatItemCard(
              icon: Icons.payments_rounded,
              value: profile.todayEarned,
              title: 'Earned (EGP)',
              valueColor: const Color(0xFF0FA860),
              iconBg: const Color(0xFFD8F5EB),
              iconColor: const Color(0xFF0FA860),
            ),
          ],
        ),
        SizedBox(height: 14.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
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
          child: Row(
            children: <Widget>[
              DriverProfileMetricItem(
                value: profile.totalDeliveries,
                title: 'Total Deliveries',
                valueColor: const Color(0xFF0B2650),
              ),
              Container(
                width: 1.w,
                height: 52.h,
                color: const Color(0xFFE0E8F4),
              ),
              DriverProfileMetricItem(
                value: profile.avgRating,
                title: 'Avg. Rating',
                valueColor: const Color(0xFF1464D8),
              ),
              Container(
                width: 1.w,
                height: 52.h,
                color: const Color(0xFFE0E8F4),
              ),
              DriverProfileMetricItem(
                value: profile.onTimeRate,
                title: 'On Time',
                valueColor: const Color(0xFF0FA860),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
