import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class SubscribeActiveSubscriptionsCard extends StatelessWidget {
  const SubscribeActiveSubscriptionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.04),
            blurRadius: 20.r,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 42.w,
                height: 42.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.subscriptions_rounded,
                  size: 22.sp,
                  color: const Color(0xFF3B82F6),
                ),
              ),
              horizontalSpacing(14),
              Expanded(
                child: AppText(
                  'Active Subscriptions',
                  style: font16w700.copyWith(color: const Color(0xFF1E293B)),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: AppText(
                  'View All',
                  style: font12w700.copyWith(color: const Color(0xFF3B82F6)),
                ),
              ),
            ],
          ),
          verticalSpacing(24),
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 70.w,
                  height: 70.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFF1F5F9),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.water_drop_rounded,
                    size: 32.sp,
                    color: const Color(0xFFCBD5E1),
                  ),
                ),
                verticalSpacing(16),
                AppText(
                  'No active subscriptions yet',
                  alignment: AlignmentDirectional.center,
                  style: font16w700.copyWith(color: const Color(0xFF334155)),
                ),
                verticalSpacing(6),
                AppText(
                  'Create a plan below and never run out of water',
                  alignment: AlignmentDirectional.center,
                  maxLines: 2,
                  style: font14w500.copyWith(color: const Color(0xFF94A3B8)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
