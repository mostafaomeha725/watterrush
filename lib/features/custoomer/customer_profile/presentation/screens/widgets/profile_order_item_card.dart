import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_models.dart';

class ProfileOrderItemCard extends StatelessWidget {
  const ProfileOrderItemCard({super.key, required this.order});

  final ProfileOrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAFF),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFDDE6F1)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: AppAsset(
                  assetName: order.thumbnailAsset,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 9.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Order ${order.id}',
                      style: font16w700.copyWith(
                        color: const Color(0xFF364D70),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    AppText(
                      order.dateLabel,
                      style: font12w400.copyWith(
                        color: const Color(0xFF7C8EA5),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 8.sp,
                          color: const Color(0xFF35B56D),
                        ),
                        SizedBox(width: 5.w),
                        AppText(
                          order.status,
                          style: font14w700.copyWith(
                            color: const Color(0xFF35B56D),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    AppText(
                      order.itemsSummary,
                      style: font12w400.copyWith(
                        color: const Color(0xFF5A6F8D),
                      ),
                    ),
                    AppText(
                      order.deliveryType,
                      style: font12w400.copyWith(
                        color: const Color(0xFF5A6F8D),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppText(
                    order.totalPrice,
                    style: font20w700.copyWith(color: const Color(0xFF2A5FBA)),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 64.w,
                    height: 36.h,
                    child: AppButton(
                      text: 'Reorder',
                      onPressed: () {},
                      color: const Color(0xFFDDE9FF),
                      textColor: const Color(0xFF437DE0),
                      textSize: 10.sp,
                      textWeight: FontWeight.w700,
                      radius: 16.r,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(
                Icons.access_time_rounded,
                size: 12.sp,
                color: const Color(0xFF8A9AB0),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: AppText(
                  order.meta,
                  style: font10w500.copyWith(color: const Color(0xFF7B8CA3)),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
