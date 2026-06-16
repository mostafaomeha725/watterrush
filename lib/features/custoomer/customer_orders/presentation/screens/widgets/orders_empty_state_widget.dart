import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class OrdersEmptyStateWidget extends StatelessWidget {
  const OrdersEmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 60.h),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(32.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                shape: BoxShape.circle,
              ),
              child: AppAsset(
                assetName: Assets.shoppingBag,
                width: 100.w,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 32.h),
            AppText(
              'No Orders Yet!',
              alignment: AlignmentDirectional.center,
              style: font22w700.copyWith(color: const Color(0xFF1A1D26)),
            ),
            SizedBox(height: 12.h),
            AppText(
              'Looks like you haven\'t placed\nany orders so far.',
              textAlign: TextAlign.center,
              alignment: AlignmentDirectional.center,
              style: font16w400.copyWith(
                color: const Color(0xFF868C98),
                height: 1.5,
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.w),
              child: AppButton.icon(
                text: 'Order Now',
                onPressed: () {
                  context.pop('go_to_cart_tab');
                },
                radius: 30.r,
                height: 54.h,
                textSize: 16.sp,
                textWeight: FontWeight.w600,
                color: const Color(0xFF1178DD),
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
