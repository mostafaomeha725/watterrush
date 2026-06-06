import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/entities/cart_item_entity.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_item_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/clear_cart_dialog.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/remove_cart_item_dialog.dart';

class CartItemsListWidget extends StatelessWidget {
  final List<CartItemEntity> items;

  const CartItemsListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              'Cart Items (${items.length})',
              style: font14w700.copyWith(color: const Color(0xFF24385B)),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) =>
                      ClearCartDialog(cartCubit: context.read<CartCubit>()),
                );
              },
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.trash,
                    size: 16.sp,
                    color: Colors.redAccent,
                  ),
                  SizedBox(width: 4.w),
                  AppText(
                    'Clear All',
                    style: font12w700.copyWith(color: Colors.redAccent),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        ...List.generate(
          items.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: CartItemCard(
              item: items[index],
              onIncrement: () {
                context.read<CartCubit>().updateCartItem(
                  items[index].id,
                  items[index].quantity + 1,
                );
              },
              onDecrement: () {
                if (items[index].quantity > 1) {
                  context.read<CartCubit>().updateCartItem(
                    items[index].id,
                    items[index].quantity - 1,
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (ctx) => RemoveCartItemDialog(
                      item: items[index],
                      cartCubit: context.read<CartCubit>(),
                    ),
                  );
                }
              },
              onRemove: () {
                showDialog(
                  context: context,
                  builder: (ctx) => RemoveCartItemDialog(
                    item: items[index],
                    cartCubit: context.read<CartCubit>(),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
