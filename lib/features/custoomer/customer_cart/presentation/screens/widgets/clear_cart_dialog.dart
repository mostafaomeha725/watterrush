import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';

class ClearCartDialog extends StatelessWidget {
  final CartCubit cartCubit;

  const ClearCartDialog({super.key, required this.cartCubit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Text(
        'Clear Cart',
        style: font14w700.copyWith(color: const Color(0xFF24385B)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Are you sure you want to remove all items from your cart?',
            style: font12w500.copyWith(color: const Color(0xFF7E8EA8)),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: font14w700.copyWith(color: const Color(0xFF7E8EA8)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            cartCubit.clearCart();
          },
          child: Text(
            'Clear',
            style: font14w700.copyWith(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }
}
