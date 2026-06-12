import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_product_card_actions.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/entities/product_entity.dart';

class CustomerHomePopularProductCartActions extends StatefulWidget {
  const CustomerHomePopularProductCartActions({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  final ProductEntity product;
  final void Function(int quantity) onAddToCart;

  @override
  State<CustomerHomePopularProductCartActions> createState() =>
      _CustomerHomePopularProductCartActionsState();
}

class _CustomerHomePopularProductCartActionsState
    extends State<CustomerHomePopularProductCartActions> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    if (!widget.product.available) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF5F5),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xFFFFD6D6)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.hourglass_empty_rounded,
              size: 14.sp,
              color: const Color(0xFFE53935),
            ),
            SizedBox(width: 4.w),
            AppText(
              'Sold Out',
              style: font12w700.copyWith(color: const Color(0xFFE53935)),
            ),
          ],
        ),
      );
    }

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        bool isAdded = false;
        int currentQuantity = quantity;

        if (cartState is CartLoaded) {
          try {
            final cartItem = cartState.cart.items.firstWhere(
              (item) => item.productId == widget.product.id,
            );
            isAdded = true;
            currentQuantity = cartItem.quantity;
          } catch (_) {}
        }

        return OfferProductCardActions(
          quantity: currentQuantity,
          isAdded: isAdded,
          onIncrement: () {
            if (isAdded && cartState is CartLoaded) {
              try {
                final cartItem = cartState.cart.items.firstWhere(
                  (item) => item.productId == widget.product.id,
                );
                context.read<CartCubit>().updateCartItem(
                  cartItem.id,
                  cartItem.quantity + 1,
                );
              } catch (_) {}
            } else {
              setState(() {
                quantity++;
              });
            }
          },
          onDecrement: () {
            if (isAdded && cartState is CartLoaded) {
              try {
                final cartItem = cartState.cart.items.firstWhere(
                  (item) => item.productId == widget.product.id,
                );
                if (cartItem.quantity == 1) {
                  context.read<CartCubit>().removeCartItem(cartItem.id);
                  setState(() {
                    quantity = 1;
                  });
                } else {
                  context.read<CartCubit>().updateCartItem(
                    cartItem.id,
                    cartItem.quantity - 1,
                  );
                }
              } catch (_) {}
            } else {
              if (quantity > 1) {
                setState(() {
                  quantity--;
                });
              }
            }
          },
          onAddToCart: () => widget.onAddToCart(quantity),
          addButtonText: 'Add',
        );
      },
    );
  }
}
