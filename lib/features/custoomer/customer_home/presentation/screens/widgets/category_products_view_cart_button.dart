import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/custom_button.dart';

class CategoryProductsViewCartButton extends StatelessWidget {
  const CategoryProductsViewCartButton({
    super.key,
    required this.cartCount,
    required this.onPressed,
  });

  final int cartCount;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton.icon(
      text: 'View Cart ($cartCount)',
      onPressed: onPressed,
      color: const Color(0xFF1178DD),
      radius: 14.r,
      height: 50.h,
      textSize: 16.sp,
      textWeight: FontWeight.w700,
      child: Icon(
        Icons.shopping_cart_checkout_rounded,
        size: 20.sp,
        color: Colors.white,
      ),
    );
  }
}
