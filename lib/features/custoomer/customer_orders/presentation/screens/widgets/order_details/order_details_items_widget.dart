import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class OrderDetailsItemsWidget extends StatefulWidget {
  const OrderDetailsItemsWidget({super.key});

  @override
  State<OrderDetailsItemsWidget> createState() =>
      _OrderDetailsItemsWidgetState();
}

class _OrderDetailsItemsWidgetState extends State<OrderDetailsItemsWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Order Items (1)',
            style: font16w700.copyWith(color: const Color(0xFF0F2B46)),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.w,
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F8FB),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: AppAsset(assetName: Assets.water), // Use placeholder
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      '1 Liter gallons',
                      style: font14w700.copyWith(
                        color: const Color(0xFF1B2028),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    AppText(
                      'Qty: 4 • EGP 400 each',
                      style: font12w500.copyWith(
                        color: const Color(0xFF8B92A2),
                      ),
                    ),
                  ],
                ),
              ),
              AppText(
                'EGP 1,600',
                style: font14w700.copyWith(color: const Color(0xFF1B2028)),
              ),
            ],
          ),
          if (isExpanded) ...[
            SizedBox(height: 12.h),
            Divider(color: const Color(0xFFF3F4F6)),
            // Render more items here if applicable.
            SizedBox(height: 12.h),
            Center(
              child: AppText(
                'No other items',
                style: font12w500.copyWith(color: const Color(0xFF8B92A2)),
              ),
            ),
          ],
          SizedBox(height: 16.h),
          Divider(color: const Color(0xFFF3F4F6)),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  isExpanded ? 'Hide Items' : 'View All Items',
                  style: font12w700.copyWith(color: const Color(0xFF0B48C6)),
                ),
                SizedBox(width: 4.w),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: const Color(0xFF0B48C6),
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
