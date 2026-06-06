import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_header.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/orders_dummy_data.dart';
import 'order_details_banner_widget.dart';
import 'order_details_info_cards_widget.dart';
import 'order_progress_timeline_widget.dart';
import 'order_details_items_widget.dart';
import 'order_details_summary_widget.dart';
import 'order_details_address_widget.dart';

class CustomerOrderDetailsScreenBody extends StatelessWidget {
  final String orderId;

  const CustomerOrderDetailsScreenBody({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    // Find order or fallback to first
    final order = OrdersDummyData.orders.firstWhere(
      (o) => o.id == orderId,
      orElse: () => OrdersDummyData.orders.first,
    );

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            CheckoutHeader(
              onBackTap: () => context.pop(),
              title: 'Order #${order.id}',
              // trailing: Container(
              //   padding: EdgeInsets.all(8.r),
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFF3F4F6),
              //     borderRadius: BorderRadius.circular(12.r),
              //   ),
              //   child: Icon(
              //     Icons.headset_mic_outlined,
              //     color: const Color(0xFF0F2B46),
              //     size: 20.sp,
              //   ),
              // ),
            ),
            SizedBox(height: 24.h),
            OrderDetailsBannerWidget(order: order),
            SizedBox(height: 16.h),
            OrderDetailsInfoCardsWidget(order: order),
            SizedBox(height: 24.h),
            OrderProgressTimelineWidget(currentStatus: order.status),
            SizedBox(height: 24.h),
            const OrderDetailsItemsWidget(),
            SizedBox(height: 24.h),
            OrderDetailsSummaryWidget(order: order),
            SizedBox(height: 24.h),
            const OrderDetailsAddressWidget(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
