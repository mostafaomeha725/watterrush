import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class OfferSliderCard extends StatelessWidget {
  const OfferSliderCard({super.key, required this.data, required this.onTap});

  final OfferSliderItemData data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          gradient: LinearGradient(
            colors: data.colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    data.title,
                    maxLines: 2,
                    style: font22w700.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 6.h),
                  AppText(data.subtitle, maxLines: 2, style: font12w500),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                width: 74.w,
                height: 74.w,
                color: const Color(0x26FFFFFF),
                child: AppAsset(assetName: data.imagePath, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
