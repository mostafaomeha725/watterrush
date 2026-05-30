import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CustomerHomeReorderCard extends StatelessWidget {
  const CustomerHomeReorderCard({required this.onReorder, super.key});

  final VoidCallback onReorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 9.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F8FF),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFE2EBF7)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFBED0E8).withValues(alpha: 0.12),
            blurRadius: 14.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: const Color(0xFFE3EFFF),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: AppAsset(
                assetName: Assets.shoppingBag,
                width: 18.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Reorder Last Order',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF27406A),
                  ),
                ),
                AppText(
                  'Save time by ordering again',
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: const Color(0xFF778AA8),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 98.w,
            child: AppButton(
              text: 'Reorder Now',
              onPressed: onReorder,
              height: 36.h,
              radius: 14.r,
              color: const Color(0xFF1E6EF2),
              borderColor: const Color(0xFF1E6EF2),
              textColor: Colors.white,
              textSize: 9.5.sp,
              textWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}