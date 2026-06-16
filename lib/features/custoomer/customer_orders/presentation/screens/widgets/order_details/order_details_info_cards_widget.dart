import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';
import 'order_details_info_item_widget.dart';

class OrderDetailsInfoCardsWidget extends StatelessWidget {
  final CustomerOrderEntity order;

  const OrderDetailsInfoCardsWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: OrderDetailsInfoItemWidget(
                icon: Icons.payment_outlined,
                title: 'Payment',
                value: order.paymentMethod,
              ),
            ),
            Expanded(
              child: OrderDetailsInfoItemWidget(
                icon: Icons.receipt_long_outlined,
                title: 'Total',
                value: 'EGP ${order.total.toStringAsFixed(0)}',
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: OrderDetailsInfoItemWidget(
                icon: Icons.calendar_today_outlined,
                title: 'Date',
                value: order.createdAt.split('T').first,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
