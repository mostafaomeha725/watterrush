import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/entities/cart_item_entity.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';

class RemoveCartItemDialog extends StatelessWidget {
  final CartItemEntity item;
  final CartCubit cartCubit;

  const RemoveCartItemDialog({
    super.key,
    required this.item,
    required this.cartCubit,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      title: Text(
        'Remove Item',
        style: font14w700.copyWith(
          color: const Color(0xFF24385B),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Are you sure you want to remove ${item.title} from your cart?',
            style: font12w500.copyWith(
              color: const Color(0xFF7E8EA8),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: font14w700.copyWith(
              color: const Color(0xFF7E8EA8),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            cartCubit.removeCartItem(item.id);
          },
          child: Text(
            'Remove',
            style: font14w700.copyWith(
              color: Colors.redAccent,
            ),
          ),
        ),
      ],
    );
  }
}
