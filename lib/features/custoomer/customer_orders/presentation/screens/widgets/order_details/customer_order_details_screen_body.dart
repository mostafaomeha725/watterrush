import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_header.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/cubit/customer_order_details_cubit.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/cubit/customer_order_details_state.dart';
import 'order_details_banner_widget.dart';
import 'order_details_info_cards_widget.dart';
import 'order_progress_timeline_widget.dart';
import 'order_details_items_widget.dart';
import 'order_details_summary_widget.dart';
import 'order_details_address_widget.dart';

class CustomerOrderDetailsScreenBody extends StatelessWidget {
  final CustomerOrderEntity order;

  const CustomerOrderDetailsScreenBody({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerOrderDetailsCubit, CustomerOrderDetailsState>(
      builder: (context, state) {
        CustomerOrderEntity currentOrder = order;

        if (state is GetOrderDetailsSuccess) {
          currentOrder = state.order;
        }

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              children: [
                CheckoutHeader(
                  onBackTap: () => context.pop(),
                  title: 'Order #${currentOrder.id}',
                ),
                SizedBox(height: 24.h),
                if (state is GetOrderDetailsLoading)
                  Center(child: CustomLoading.showLoader())
                else if (state is GetOrderDetailsFailure)
                  Center(child: AppText(state.message))
                else ...[
                  OrderDetailsBannerWidget(order: currentOrder),
                  SizedBox(height: 16.h),
                  OrderDetailsInfoCardsWidget(order: currentOrder),
                  SizedBox(height: 24.h),
                  OrderProgressTimelineWidget(
                    currentStatus: currentOrder.status,
                  ),
                  SizedBox(height: 24.h),
                  OrderDetailsItemsWidget(order: currentOrder),
                  SizedBox(height: 24.h),
                  OrderDetailsSummaryWidget(order: currentOrder),
                  if (currentOrder.address != null) ...[
                    SizedBox(height: 24.h),
                    OrderDetailsAddressWidget(address: currentOrder.address!),
                  ],
                ],
                SizedBox(height: 40.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
