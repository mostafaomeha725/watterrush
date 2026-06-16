import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/widgets/custom_nav_bar.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_product_card.dart';

class AllPopularProductsList extends StatefulWidget {
  const AllPopularProductsList({
    super.key,
    required this.products,
    required this.cartState,
    this.footer,
  });

  final List<OfferProductItemData> products;
  final CartState cartState;
  final Widget? footer;

  @override
  State<AllPopularProductsList> createState() => _AllPopularProductsListState();
}

class _AllPopularProductsListState extends State<AllPopularProductsList> {
  final Map<int, int> _quantities = {};

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 12.h,
        bottom: 100.h,
      ),
      itemCount: widget.products.length + (widget.footer != null ? 1 : 0),
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (BuildContext context, int index) {
        if (index == widget.products.length && widget.footer != null) {
          return widget.footer!;
        }

        final mappedProduct = widget.products[index];
        int quantity = _quantities[mappedProduct.id] ?? 1;
        bool isAdded = false;

        if (widget.cartState is CartLoaded) {
          try {
            final cartItem = (widget.cartState as CartLoaded).cart.items
                .firstWhere((i) => i.productId == mappedProduct.id);
            isAdded = true;
            quantity = cartItem.quantity;
          } catch (_) {}
        }

        return GestureDetector(
          onTap: () async {
            final result = await context.push(
              Routes.productDetailsScreen,
              extra: mappedProduct.id,
            );
            if (result == 'go_to_cart_tab' && context.mounted) {
              CustomNavBar.switchToTab(context, 2);
            }
          },
          child: OfferProductCard(
            product: mappedProduct,
            quantity: quantity,
            isAdded: isAdded,
            compactLayout: true,
            onIncrement: () {
              if (isAdded && widget.cartState is CartLoaded) {
                try {
                  final cartItem = (widget.cartState as CartLoaded).cart.items
                      .firstWhere((i) => i.productId == mappedProduct.id);
                  context.read<CartCubit>().updateCartItem(
                    cartItem.id,
                    cartItem.quantity + 1,
                  );
                } catch (_) {}
              } else {
                setState(() {
                  _quantities[mappedProduct.id] = quantity + 1;
                });
              }
            },
            onDecrement: () {
              if (isAdded && widget.cartState is CartLoaded) {
                try {
                  final cartItem = (widget.cartState as CartLoaded).cart.items
                      .firstWhere((i) => i.productId == mappedProduct.id);
                  if (cartItem.quantity == 1) {
                    context.read<CartCubit>().removeCartItem(cartItem.id);
                    setState(() {
                      _quantities[mappedProduct.id] = 1;
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
                    _quantities[mappedProduct.id] = quantity - 1;
                  });
                }
              }
            },
            onAddToCart: () {
              context.read<CartCubit>().addToCart(mappedProduct.id, quantity);
            },
          ),
        );
      },
    );
  }
}
