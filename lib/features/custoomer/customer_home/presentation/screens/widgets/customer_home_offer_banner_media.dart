import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'customer_home_view_models.dart';

import 'package:waterrush/core/widgets/app_image.dart';
import '../../../domain/entities/slider_entity.dart';

class CustomerHomeOfferBannerMedia extends StatelessWidget {
  const CustomerHomeOfferBannerMedia({
    required this.data,
    this.slider,
    super.key,
  });

  final HomeBannerViewModel data;
  final SliderEntity? slider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 175.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 20.h,
            bottom: 20.h,
            right: 25.w,
            child: slider != null
                ? AppImage(
                    imageUrl: slider!.image,
                    width: 100.w,
                    fit: BoxFit.contain,
                  )
                : AppAsset(
                    assetName: Assets.gallon,
                    width: 100.w,
                    fit: BoxFit.contain,
                  ),
          ),
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
        ],
      ),
    );
  }
}
