import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/auth/presentation/widgets/stats_item_driver_login.dart';

class DriverLoginStatsCard extends StatelessWidget {
  const DriverLoginStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: const Color(0xFFE1EAF6), width: 1.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7EA7DC).withValues(alpha: 0.14),
            blurRadius: 14.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 26.w,
                height: 26.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF1F8FF),
                ),
                child: Icon(
                  Icons.bar_chart_rounded,
                  color: const Color(0xFF3495FF),
                  size: 18.sp,
                ),
              ),
              SizedBox(width: 8.w),
              AppText(
                "Today's Stats",
                style: font18w700.copyWith(color: const Color(0xFF173B72)),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              const Expanded(
                child: StatsItemDriverLogin(
                  icon: Icons.inventory_2_outlined,
                  iconColor: Color(0xFF4D9DFF),
                  title: 'Deliveries',
                  value: '12',
                  valueColor: Color(0xFF2A83F0),
                ),
              ),
              Container(
                width: 1.w,
                height: 76.h,
                color: const Color(0xFFE6EDF7),
              ),
              const Expanded(
                child: StatsItemDriverLogin(
                  icon: Icons.monetization_on_rounded,
                  iconColor: Color(0xFF28B86A),
                  title: 'Earnings',
                  value: '\$96',
                  valueColor: Color(0xFF1EA860),
                ),
              ),
              Container(
                width: 1.w,
                height: 76.h,
                color: const Color(0xFFE6EDF7),
              ),
              const Expanded(
                child: StatsItemDriverLogin(
                  icon: Icons.star_rounded,
                  iconColor: Color(0xFFF7B733),
                  title: 'Rating',
                  value: '4.8',
                  valueColor: Color(0xFF2A83F0),
                  valueTrailingIcon: Icons.star_rounded,
                  valueTrailingIconColor: Color(0xFFF7B733),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}