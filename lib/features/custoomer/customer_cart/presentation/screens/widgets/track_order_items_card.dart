import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/order_item_raw.dart';

class TrackOrderItemsCard extends StatelessWidget {
  const TrackOrderItemsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFE2E8EF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Order Items',
            style: font20w500.copyWith(color: const Color(0xFF0C223A)),
          ),
          verticalSpacing(12),
          const OrderItemRow(
            emoji: '💧',
            title: 'Aquafina 12-Pack',
            quantity: 'Qty: 2',
            price: '\$17.98',
          ),
          verticalSpacing(10),
          const OrderItemRow(
            emoji: '🧉',
            title: '5-Gallon Jug',
            quantity: 'Qty: 1',
            price: '\$12.99',
          ),
        ],
      ),
    );
  }
}
