import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'orders_dummy_data.dart';
import 'order_status_extension.dart';

class OrderItemCard extends StatelessWidget {
  final OrderDummyModel order;

  const OrderItemCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final statusColor = order.status.statusColor;
    final statusText = order.status.statusText;
    final statusIcon = order.status.statusIcon;

    IconData mainIcon = Icons.shopping_bag_rounded;
    if (order.id == '6' || order.id == '3') {
      mainIcon = Icons.local_shipping_rounded;
    }
    if (order.id == '4' || order.id == '1') {
      mainIcon = Icons.inventory_2_rounded;
    }

    Color mainIconBgColor = statusColor.withOpacity(0.15);
    Color mainIconColor = statusColor;

    return BounceIt(
      onPressed: () {
        context.push(
          Routes.customerOrderDetailsScreen,
          extra: {'orderId': order.id},
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
              color: mainIconBgColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Icon(mainIcon, color: mainIconColor, size: 28.sp),
                Positioned(
                  bottom: -2.h,
                  right: -2.w,
                  child: Container(
                    padding: EdgeInsets.all(2.r),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(3.r),
                      child: Icon(statusIcon, color: Colors.white, size: 10.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      'Order #${order.id}',
                      style: font16w700.copyWith(
                        color: const Color(0xFF1B2028),
                      ),
                    ),
                    AppText(
                      'EGP ${order.amount.toStringAsFixed(2)}',
                      style: font14w700.copyWith(
                        color: const Color(0xFF4C44FB),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: const Color(0xFF8B92A2),
                          size: 14.sp,
                        ),
                        SizedBox(width: 6.w),
                        AppText(
                          '${order.date} • ${order.paymentMethod}',
                          style: font12w400.copyWith(
                            color: const Color(0xFF8B92A2),
                          ),
                        ),
                      ],
                    ),

                    Icon(
                      Icons.chevron_right_rounded,
                      color: const Color(0xFF8B92A2),
                      size: 24.sp,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(statusIcon, color: statusColor, size: 14.sp),
                      SizedBox(width: 4.w),
                      AppText(
                        statusText,
                        style: font14w700.copyWith(
                          color: statusColor,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
