import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/order_status_extension.dart';
import 'order_details_info_item_widget.dart';

class OrderDetailsBannerWidget extends StatelessWidget {
  final CustomerOrderEntity order;

  const OrderDetailsBannerWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: order.status.statusBgColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Current Status',
                  style: font12w400.copyWith(color: order.status.statusColor),
                ),
                SizedBox(height: 4.h),
                AppText(
                  order.status.statusText,
                  style: font24w700.copyWith(color: order.status.statusColor),
                ),
                SizedBox(height: 8.h),
                AppText(
                  order.status.statusSubtitle,
                  overflow: TextOverflow.visible,
                  style: font12w400.copyWith(
                    color: const Color(0xFF4B5563),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Image.asset(
            order.status.statusImage,
            width: 125.w,
            height: 125.w,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
