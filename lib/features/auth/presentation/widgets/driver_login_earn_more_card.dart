import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class DriverLoginEarnMoreCard extends StatelessWidget {
  const DriverLoginEarnMoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE1EAF6), width: 1.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7EA7DC).withValues(alpha: 0.12),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEFF6FF),
            ),
            padding: EdgeInsets.all(8.w),
            child: const AppAsset(assetName: Assets.giftAlt),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Earn More',
                  style: font16w700.copyWith(color: const Color(0xFF1D3C71)),
                ),
                SizedBox(height: 2.h),
                AppText(
                  'Complete deliveries to increase your earnings',
                  style: font10w500.copyWith(color: const Color(0xFF7B8EAA)),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: const Color(0xFF4A9EFF),
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}