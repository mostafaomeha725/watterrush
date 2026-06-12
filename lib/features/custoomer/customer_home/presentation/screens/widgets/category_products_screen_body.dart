import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/category_products_cubit/category_products_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/category_products_cubit/category_products_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/category_products_header.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/category_products_main_content.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/category_products_floating_cart.dart';

class CategoryProductsScreenBody extends StatefulWidget {
  const CategoryProductsScreenBody({super.key});

  @override
  State<CategoryProductsScreenBody> createState() =>
      _CategoryProductsScreenBodyState();
}

class _CategoryProductsScreenBodyState
    extends State<CategoryProductsScreenBody> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
      builder: (BuildContext context, CategoryProductsState state) {
        if (state.isLoading && state.category == null) {
          return Center(child: CustomLoading.showLoader());
        }

        if (state.category == null) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppText(
                    'Category data is unavailable.',
                    style: font18w700.copyWith(color: const Color(0xFF153A63)),
                    alignment: AlignmentDirectional.center,
                  ),
                  verticalSpacing(12),
                  AppButton(
                    text: 'Go Back',
                    onPressed: context.pop,
                    radius: 14.r,
                    color: const Color(0xFF1E73D9),
                    textSize: 14.sp,
                  ),
                ],
              ),
            ),
          );
        }

        final double headerPlaceholderHeight = 230.h;

        return SafeArea(
          child: Stack(
            children: <Widget>[
              CategoryProductsMainContent(
                state: state,
                headerPlaceholderHeight: headerPlaceholderHeight,
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, cartState) {
                    int globalCartCount = 0;
                    if (cartState is CartLoaded) {
                      globalCartCount = cartState.cart.items.fold(
                        0,
                        (sum, item) => sum + item.quantity,
                      );
                    }
                    return CategoryProductsHeader(
                      category: state.category!,
                      cartCount: globalCartCount,
                      searchController: searchController,
                      onBackTap: context.pop,
                      onCartTap: () {
                        context.pop('go_to_cart_tab');
                      },
                      onSearchChanged: (String value) {
                        context.read<CategoryProductsCubit>().updateSearchQuery(
                          value,
                        );
                      },
                    );
                  },
                ),
              ),
              const CategoryProductsFloatingCart(),
              if (state.isLoading && state.category != null)
                Positioned.fill(child: CustomLoading.showLoader()),
            ],
          ),
        );
      },
    );
  }
}
