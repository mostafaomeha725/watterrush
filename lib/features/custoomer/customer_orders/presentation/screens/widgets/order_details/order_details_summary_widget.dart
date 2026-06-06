import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/orders_dummy_data.dart';
import 'order_summary_row_widget.dart';

class OrderDetailsSummaryWidget extends StatelessWidget {
  final OrderDummyModel order;

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
          const OrderSummaryRowWidget(title: 'Subtotal', value: 'EGP 1,600', isIconCheck: false),
          SizedBox(height: 12.h),
          const OrderSummaryRowWidget(title: 'Delivery Fee', value: 'EGP 10', isIconCheck: false),
          SizedBox(height: 12.h),
          const OrderSummaryRowWidget(
            title: 'Discount (WEEKEND35)',
            value: '- EGP 560',
            isIconCheck: true,
            valueColor: Color(0xFF10B981),
          ),
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
                'EGP 1,050',
                style: font16w700.copyWith(color: const Color(0xFF0B48C6)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
