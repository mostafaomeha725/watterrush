import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/cubit/customer_orders_cubit.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/cubit/customer_orders_state.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/orders_header_widget.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/orders_tabs_widget.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/orders_list_header_widget.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/order_item_card.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/orders_summary_bottom_bar.dart';
import 'package:waterrush/core/widgets/pagination_widget.dart';

class CustomerOrdersScreenBody extends StatelessWidget {
  const CustomerOrdersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerOrdersCubit, CustomerOrdersState>(
      builder: (context, state) {
        final cubit = context.read<CustomerOrdersCubit>();
        final orders = cubit.filteredOrders;
        final totalSpent = orders.fold<double>(
          0,
          (sum, item) => sum + item.total,
        );
        final totalOrders = orders.length;

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
                    SizedBox(height: 24.h),
                    OrdersListHeaderWidget(),
                    SizedBox(height: 16.h),
                    if (state is GetOrdersLoading)
                      Center(child: CustomLoading.showLoader())
                    else if (state is GetOrdersFailure)
                      Center(child: AppText(state.message))
                    else if (orders.isEmpty)
                      const Center(child: AppText('No orders found.'))
                    else
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: orders
                              .map((order) => OrderItemCard(order: order))
                              .toList(),
                        ),
                      ),
                    if (cubit.lastPage > 1)
                      PaginationWidget(
                        totalPages: cubit.lastPage,
                        currentPage: cubit.currentPage,
                        onPageChanged: (page) {
                          cubit.getOrders(page: page);
                        },
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
      },
    );
  }
}
