import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/category_products_view_cart_button.dart';

class CategoryProductsFloatingCart extends StatelessWidget {
  const CategoryProductsFloatingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        int globalCartCount = 0;
        if (cartState is CartLoaded) {
          globalCartCount = cartState.cart.items.fold(
            0,
            (sum, item) => sum + item.quantity,
          );
        }
        if (globalCartCount > 0) {
          return Positioned(
            right: 16.w,
            left: 16.w,
            bottom: 16.h,
            child: SafeArea(
              top: false,
              child: CategoryProductsViewCartButton(
                cartCount: globalCartCount,
                onPressed: () {
                  context.pop('go_to_cart_tab');
                },
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
