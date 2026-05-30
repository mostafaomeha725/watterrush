import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CartCheckoutBar extends StatelessWidget {
  const CartCheckoutBar({
    super.key,
    required this.total,
    required this.onCheckout,
  });

  final double total;
  final VoidCallback onCheckout;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 52.h),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF1C3552), width: 0.7)),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 22.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Total Amount',
                  style: font14w400.copyWith(color: const Color(0xFF44576E)),
                ),
                SizedBox(height: 2.h),
                AppText(
                  '\$${total.toStringAsFixed(2)}',
                  style: font24w700.copyWith(color: const Color(0xFF0598D6)),
                ),
              ],
            ),

            AppButton(
              text: 'Proceed to Checkout',
              color: AppLightColors.buttonColor1,
              textSize: 16.sp,
              height: 52.h,
              contentPadding: EdgeInsets.symmetric(horizontal: 22.w),
              onPressed: onCheckout,
            ),
          ],
        ),
      ),
    );
  }
}