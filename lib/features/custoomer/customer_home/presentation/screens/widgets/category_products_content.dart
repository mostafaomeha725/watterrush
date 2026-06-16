import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/category_products_cubit/category_products_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_product_card.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/widgets/custom_nav_bar.dart';

class CategoryProductsContent extends StatelessWidget {
  const CategoryProductsContent({
    super.key,
    required this.state,
    required this.onShowAllProducts,
    required this.onIncrement,
    required this.onDecrement,
    required this.onAddToCart,
    required this.cartState,
  });

  final CategoryProductsState state;
  final VoidCallback onShowAllProducts;
  final ValueChanged<int> onIncrement;
  final ValueChanged<int> onDecrement;
  final ValueChanged<int> onAddToCart;
  final CartState cartState;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: Center(child: CustomLoading.showLoader(scale: 0.7)),
      );
    }

    if (state.displayedProductIndexes.isEmpty) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFD9E4F2)),
        ),
        child: Column(
          children: <Widget>[
            AppText(
              'No products match your filters.',
              style: font14w700.copyWith(color: const Color(0xFF23405F)),
              alignment: AlignmentDirectional.center,
            ),
            verticalSpacing(12),
            AppButton(
              text: 'Show All Products',
              onPressed: onShowAllProducts,
              color: const Color(0xFF1178DD),
              textSize: 13.sp,
              radius: 10.r,
            ),
          ],
        ),
      );
    }

    return Column(
      children: state.displayedProductIndexes.map((int productIndex) {
        final product = state.category!.products[productIndex];
        bool isAdded = false;
        int qty = state.quantityFor(productIndex);

        if (cartState is CartLoaded) {
          final cart = (cartState as CartLoaded).cart;
          try {
            final cartItem = cart.items.firstWhere(
              (i) => i.productId == product.id,
            );
            isAdded = true;
            qty = cartItem.quantity;
          } catch (_) {}
        }

        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: GestureDetector(
            onTap: () async {
              final result = await context.push(
                Routes.productDetailsScreen,
                extra: product.id,
              );
              if (result == 'go_to_cart_tab' && context.mounted) {
                CustomNavBar.switchToTab(context, 2);
              }
            },
            child: OfferProductCard(
              product: product,
              quantity: qty,
              onIncrement: () => onIncrement(productIndex),
              onDecrement: () => onDecrement(productIndex),
              onAddToCart: () => onAddToCart(productIndex),
              compactLayout: true,
              isAdded: isAdded,
              addButtonText: '+ Add',
              addedButtonText: 'Added',
            ),
          ),
        );
      }).toList(),
    );
  }
}
