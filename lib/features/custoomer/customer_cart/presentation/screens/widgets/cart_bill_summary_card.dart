import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_price_row.dart';

class CartBillSummaryCard extends StatelessWidget {
  const CartBillSummaryCard({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    this.discount = 0.0,
  });

  final double subtotal;
  final double deliveryFee;
  final double discount;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppLightColors.defaultBackground,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFDDE3EC)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Bill Summary',
            style: font18w700.copyWith(color: const Color(0xFF0F2B46)),
          ),
          SizedBox(height: 12.h),
          CartPriceRow(label: 'Subtotal', value: subtotal, bold: false),
          SizedBox(height: 8.h),
          CartPriceRow(label: 'Delivery Fee', value: deliveryFee, bold: false),
          if (discount > 0) ...[
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  'Discount',
                  style: font14w400.copyWith(color: const Color(0xFFE22020)),
                ),
                AppText(
                  '- EGP ${discount.toStringAsFixed(2)}',
                  style: font14w700.copyWith(color: const Color(0xFFE22020)),
                ),
              ],
            ),
          ],
          SizedBox(height: 10.h),
          Divider(height: 1, color: const Color(0xFFD0D7E0)),
          SizedBox(height: 10.h),
          CartPriceRow(label: 'Total', value: total, bold: true),
        ],
      ),
    );
  }
}
