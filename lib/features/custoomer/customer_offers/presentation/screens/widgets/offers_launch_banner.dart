import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class OffersLaunchBanner extends StatelessWidget {
  const OffersLaunchBanner({super.key, required this.onClaimNow});

  final VoidCallback onClaimNow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 16.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF08B2D5), Color(0xFF3A86F7)],
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Opacity(
              opacity: 0.20,
              child: AppAsset(assetName: Assets.gift, height: 90.h),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.22),
                  borderRadius: BorderRadius.circular(999.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  child: Text(
                    'Limited Time',
                    style: font12w700.copyWith(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              AppText(
                'Special Launch Offer!',
                style: font20w700.copyWith(color: const Color(0xFF08213B)),
              ),
              SizedBox(height: 6.h),
              AppText(
                'Get 20% off on your first 3 orders',
                style: font14w400.copyWith(color: Colors.white),
              ),
              SizedBox(height: 14.h),
              SizedBox(
                width: 120.w,
                child: AppButton(
                  text: 'Claim Now',
                  onPressed: onClaimNow,
                  color: Colors.white,
                  textColor: const Color(0xFF0598D6),
                  textSize: 14.sp,
                  textWeight: FontWeight.w700,
                  radius: 14.r,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
