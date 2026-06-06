import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/orders_header_widget.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/orders_tabs_widget.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/orders_list_header_widget.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/order_item_card.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/orders_summary_bottom_bar.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/orders_dummy_data.dart';

class CustomerOrdersScreenBody extends StatelessWidget {
  const CustomerOrdersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final totalSpent = OrdersDummyData.orders.fold<double>(
      0,
      (sum, item) => sum + item.amount,
    );
    final totalOrders = OrdersDummyData.orders.length;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                const OrdersHeaderWidget(),
                SizedBox(height: 20.h),
                OrdersTabsWidget(),
                // SizedBox(height: 20.h),
                // const OrdersBannerWidget(),
                SizedBox(height: 24.h),
                OrdersListHeaderWidget(),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: OrdersDummyData.orders
                        .map((order) => OrderItemCard(order: order))
                        .toList(),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
        OrdersSummaryBottomBar(
          totalOrders: totalOrders,
          totalSpent: totalSpent,
        ),
      ],
    );
  }
}
