import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_product_card_actions.dart';

class ProductDetailsBottomBar extends StatefulWidget {
  const ProductDetailsBottomBar({
    super.key,
    required this.productId,
    required this.isAvailable,
  });

  final int productId;
  final bool isAvailable;

  @override
  State<ProductDetailsBottomBar> createState() => _ProductDetailsBottomBarState();
}

class _ProductDetailsBottomBarState extends State<ProductDetailsBottomBar> {
  int localQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: Offset(0, -5.h),
          ),
        ],
      ),
      child: widget.isAvailable
          ? BlocBuilder<CartCubit, CartState>(
              builder: (context, cartState) {
                bool isAdded = false;
                int currentQuantity = localQuantity;

                if (cartState is CartLoaded) {
                  try {
                    final cartItem = cartState.cart.items.firstWhere(
                      (item) => item.productId == widget.productId,
                    );
                    isAdded = true;
                    currentQuantity = cartItem.quantity;
                  } catch (_) {}
                }

                return OfferProductCardActions(
                  quantity: currentQuantity,
                  isAdded: isAdded,
                  isLarge: true,
                  onIncrement: () {
                    if (isAdded && cartState is CartLoaded) {
                      try {
                        final cartItem = cartState.cart.items.firstWhere(
                          (item) => item.productId == widget.productId,
                        );
                        context.read<CartCubit>().updateCartItem(
                          cartItem.id,
                          cartItem.quantity + 1,
                        );
                      } catch (_) {}
                    } else {
                      setState(() {
                        localQuantity++;
                      });
                    }
                  },
                  onDecrement: () {
                    if (isAdded && cartState is CartLoaded) {
                      try {
                        final cartItem = cartState.cart.items.firstWhere(
                          (item) => item.productId == widget.productId,
                        );
                        if (cartItem.quantity == 1) {
                          context.read<CartCubit>().removeCartItem(cartItem.id);
                          setState(() {
                            localQuantity = 1;
                          });
                        } else {
                          context.read<CartCubit>().updateCartItem(
                            cartItem.id,
                            cartItem.quantity - 1,
                          );
                        }
                      } catch (_) {}
                    } else {
                      if (localQuantity > 1) {
                        setState(() {
                          localQuantity--;
                        });
                      }
                    }
                  },
                  onAddToCart: () {
                    context.read<CartCubit>().addToCart(
                      widget.productId,
                      currentQuantity,
                    );
                  },
                );
              },
            )
          : Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5F5),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: const Color(0xFFFFD6D6),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.hourglass_empty_rounded,
                    size: 20.sp,
                    color: const Color(0xFFE53935),
                  ),
                  SizedBox(width: 8.w),
                  AppText(
                    'Currently Sold Out',
                    style: font16w700.copyWith(color: const Color(0xFFE53935)),
                  ),
                ],
              ),
            ),
    );
  }
}
