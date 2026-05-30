import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'customer_home_view_models.dart';

class CustomerHomeOfferBannerMedia extends StatelessWidget {
  const CustomerHomeOfferBannerMedia({required this.data, super.key});

  final HomeBannerViewModel data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 175.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 20.h,
            right: 0,
            child: Container(
              width: 85.w,
              height: 85.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF0A2D8A),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    'UP TO',
                    style: font12w500.copyWith(color: Colors.white),
                    alignment: AlignmentDirectional.center,
                  ),
                  SizedBox(height: 1.h),
                  AppText(
                    '35%',
                    style: font22w700.copyWith(color: const Color(0xff08f1ff)),
                    alignment: AlignmentDirectional.center,
                  ),
                  AppText(
                    'OFF',
                    style: font12w400.copyWith(color: Colors.white),
                    alignment: AlignmentDirectional.center,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: -15.h,
            bottom: -15.h,
            right: 20.w,
            child: AppAsset(
              assetName: Assets.gallon,
              width: 180.w,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}