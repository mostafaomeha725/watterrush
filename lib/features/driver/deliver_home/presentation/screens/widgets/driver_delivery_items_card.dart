import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';

class DriverDeliveryItemsCard extends StatelessWidget {
  const DriverDeliveryItemsCard({super.key, required this.order});

  final DeliverOrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFDDE5F2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppText(
            'Order Items',
            style: font16w700.copyWith(color: const Color(0xFF93A3B9)),
          ),
          verticalSpacing(10),
          ...order.orderLines.map(
            (DeliverOrderLineModel line) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF0F4FC),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.inventory_2_outlined,
                      color: const Color(0xFF1870DF),
                      size: 15.sp,
                    ),
                  ),
                  horizontalSpacing(8),
                  Expanded(
                    child: AppText(
                      line.name,
                      style: font12w500.copyWith(
                        color: const Color(0xFF213E66),
                      ),
                    ),
                  ),
                  AppText(
                    line.priceLabel,
                    style: font14w500.copyWith(color: const Color(0xFF95A3BB)),
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1.h, thickness: 1.h, color: const Color(0xFFE4EAF5)),
          verticalSpacing(10),
          Row(
            children: <Widget>[
              AppText(
                'Total',
                style: font20w700.copyWith(color: const Color(0xFF3C5579)),
              ),
              const Spacer(),
              AppText(
                order.priceLabel,
                style: font20w700.copyWith(color: const Color(0xFF1360C4)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}