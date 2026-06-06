import 'package:flutter/material.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/orders_dummy_data.dart';
import 'order_details_info_item_widget.dart';

class OrderDetailsInfoCardsWidget extends StatelessWidget {
  final OrderDummyModel order;

  const OrderDetailsInfoCardsWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: OrderDetailsInfoItemWidget(
            icon: Icons.calendar_today_outlined,
            title: 'Date',
            value: order.date,
          ),
        ),
        Expanded(
          flex: 6,

          child: OrderDetailsInfoItemWidget(
            icon: Icons.payment_outlined,
            title: 'Payment',
            value: order.paymentMethod,
          ),
        ),
        Expanded(
          flex: 5,

          child: OrderDetailsInfoItemWidget(
            icon: Icons.receipt_long_outlined,
            title: 'Total',
            value: 'EGP ${order.amount.toStringAsFixed(0)}',
          ),
        ),
      ],
    );
  }
}
