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
        SizedBox(height: 8.h),
        Row(
          children: <Widget>[
            DriverProfileStatItemCard(
              icon: Icons.local_shipping_outlined,
              value: profile.todayRuns,
              title: 'Today\'s Runs',
              valueColor: const Color(0xFF1E6ECE),
              iconBg: const Color(0xFFE7EEF9),
              iconColor: const Color(0xFF1E6ECE),
            ),
            SizedBox(width: 8.w),
            DriverProfileStatItemCard(
              icon: Icons.star_rounded,
              value: profile.todayRating,
              title: 'Rating',
              valueColor: const Color(0xFFE89C00),
              iconBg: const Color(0xFFFAF2DD),
              iconColor: const Color(0xFFE89C00),
            ),
            SizedBox(width: 8.w),
            DriverProfileStatItemCard(
              icon: Icons.payments_outlined,
              value: profile.todayEarned,
              title: 'Earned (EGP)',
              valueColor: const Color(0xFF11B476),
              iconBg: const Color(0xFFE2F3EE),
              iconColor: const Color(0xFF11B476),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: <Widget>[
              DriverProfileMetricItem(
                value: profile.totalDeliveries,
                title: 'Total Deliveries',
                valueColor: const Color(0xFF102B55),
              ),
              _divider(),
              DriverProfileMetricItem(
                value: profile.avgRating,
                title: 'Avg. Rating',
                valueColor: const Color(0xFF1E6ECE),
              ),
              _divider(),
              DriverProfileMetricItem(
                value: profile.onTimeRate,
                title: 'On Time',
                valueColor: const Color(0xFF11B476),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return Container(width: 1.w, height: 56.h, color: const Color(0xFFD8E2F0));
  }
}
