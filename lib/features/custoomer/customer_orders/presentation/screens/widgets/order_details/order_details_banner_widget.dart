import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/orders_dummy_data.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/order_status_extension.dart';
import 'order_details_info_item_widget.dart';

class OrderDetailsBannerWidget extends StatelessWidget {
  final OrderDummyModel order;

  const OrderDetailsBannerWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          colors: [Color(0xFF0B48C6), Color(0xFF386EDF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
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
                  style: font12w400.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: 4.h),
                AppText(
                  order.status.statusText,
                  style: font24w700.copyWith(color: Colors.white),
                ),
                SizedBox(height: 8.h),
                AppText(
                  'We\'ve received your order and will update you soon.',
                  overflow: TextOverflow.visible,
                  style: font12w400.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.inventory_2_rounded,
              color: Colors.white,
              size: 40.sp,
            ),
          ),
        ],
      ),
    );
  }
}
