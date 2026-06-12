import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/category_products_cubit/category_products_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/category_products_cubit/category_products_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/category_products_content.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/category_products_filters_row.dart';
import 'package:waterrush/core/widgets/pagination_widget.dart';

class CategoryProductsMainContent extends StatelessWidget {
  const CategoryProductsMainContent({
    super.key,
    required this.state,
    required this.headerPlaceholderHeight,
  });

  final CategoryProductsState state;
  final double headerPlaceholderHeight;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 112.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: headerPlaceholderHeight + 12.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            child: CategoryProductsFiltersRow(
              showOnOfferOnly: state.showOnOfferOnly,
              sort: state.sort,
              itemCount: state.displayedProductIndexes.length,
              onToggleOnOffer: () {
                context.read<CategoryProductsCubit>().toggleOnOffer();
              },
              onSortSelected: (CategoryProductsSort selectedSort) {
                context.read<CategoryProductsCubit>().updateSort(
                  selectedSort,
                );
              },
            ),
          ),
          verticalSpacing(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, cartState) {
                return CategoryProductsContent(
                  state: state,
                  cartState: cartState,
                  onShowAllProducts: () {
                    context.push(Routes.allPopularProductsScreen);
                  },
                  onIncrement: (int productIndex) {
                    final cubit = context.read<CategoryProductsCubit>();
                    cubit.incrementQuantity(productIndex);

                    final product = cubit.state.category!.products[productIndex];
                    if (cartState is CartLoaded) {
                      try {
                        final cartItem = cartState.cart.items.firstWhere(
                          (item) => item.productId == product.id,
                        );
                        context.read<CartCubit>().updateCartItem(
                          cartItem.id,
                          cubit.state.quantityFor(productIndex),
                        );
                      } catch (_) {} // Not in cart
                    }
                  },
                  onDecrement: (int productIndex) {
                    final cubit = context.read<CategoryProductsCubit>();
                    final product = cubit.state.category!.products[productIndex];

                    if (cartState is CartLoaded) {
                      try {
                        final cartItem = cartState.cart.items.firstWhere(
                          (item) => item.productId == product.id,
                        );

                        if (cartItem.quantity == 1) {
                          context.read<CartCubit>().removeCartItem(cartItem.id);
                          cubit.decrementQuantity(productIndex);
                        } else {
                          context.read<CartCubit>().updateCartItem(
                            cartItem.id,
                            cartItem.quantity - 1,
                          );
                          cubit.decrementQuantity(productIndex);
                        }
                      } catch (_) {
                        cubit.decrementQuantity(productIndex);
                      }
                    } else {
                      cubit.decrementQuantity(productIndex);
                    }
                  },
                  onAddToCart: (int productIndex) {
                    final cubit = context.read<CategoryProductsCubit>();
                    final product = cubit.state.category!.products[productIndex];
                    
                    int quantity = cubit.state.quantityFor(productIndex);
                    if (cartState is CartLoaded) {
                      try {
                        final cartItem = cartState.cart.items.firstWhere(
                          (item) => item.productId == product.id,
                        );
                        quantity = cartItem.quantity; // If already added, fallback to actual cart
                      } catch (_) {}
                    }

                    context.read<CartCubit>().addToCart(
                      product.id,
                      quantity,
                    );

                    cubit.addToCart(productIndex);
                  },
                );
              },
            ),
          ),
          if (state.lastPage > 1)
            PaginationWidget(
              totalPages: state.lastPage,
              currentPage: state.currentPage,
              onPageChanged: (page) {
                context.read<CategoryProductsCubit>().loadCategory(
                  state.category,
                  page: page,
                );
              },
            ),
        ],
      ),
    );
  }
}
