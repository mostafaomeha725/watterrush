import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';
import 'order_summary_row_widget.dart';

class OrderDetailsSummaryWidget extends StatelessWidget {
  final CustomerOrderEntity order;

  const OrderDetailsSummaryWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Order Summary',
            style: font16w700.copyWith(color: const Color(0xFF0F2B46)),
          ),
          SizedBox(height: 16.h),
          OrderSummaryRowWidget(
            title: 'Subtotal',
            value: 'EGP ${order.subtotal?.toStringAsFixed(2) ?? "0.00"}',
            isIconCheck: false,
          ),
          SizedBox(height: 12.h),
          OrderSummaryRowWidget(
            title: 'Delivery Fee',
            value: 'EGP ${order.deliveryFee?.toStringAsFixed(2) ?? "0.00"}',
            isIconCheck: false,
          ),
          if (order.promoCode != null) ...[
            SizedBox(height: 12.h),
            OrderSummaryRowWidget(
              title: 'Discount (${order.promoCode!.code})',
              value: '- EGP ${order.promoCode!.discount.toStringAsFixed(2)}',
              isIconCheck: true,
              valueColor: const Color(0xFF10B981),
            ),
          ],
          SizedBox(height: 16.h),
          Divider(color: const Color(0xFFF3F4F6)),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                'Total',
                style: font16w700.copyWith(color: const Color(0xFF1B2028)),
              ),
              AppText(
                'EGP ${order.total.toStringAsFixed(2)}',
                style: font16w700.copyWith(color: const Color(0xFF0B48C6)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
