import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/utils/easy_loading.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/category_products_cubit/category_products_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/category_products_cubit/category_products_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/category_products_content.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/category_products_filters_row.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/category_products_header.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/category_products_view_cart_button.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/core/widgets/pagination_widget.dart';

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
              SingleChildScrollView(
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
                        state: state,
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
                      child: CategoryProductsContent(
                        state: state,
                        onShowAllProducts: () {
                          searchController.clear();
                          final CategoryProductsCubit cubit = context
                              .read<CategoryProductsCubit>();
                          cubit.updateSearchQuery('');
                          if (state.showOnOfferOnly) {
                            cubit.toggleOnOffer();
                          }
                        },
                        onIncrement: (int productIndex) {
                          context
                              .read<CategoryProductsCubit>()
                              .incrementQuantity(productIndex);
                        },
                        onDecrement: (int productIndex) {
                          context
                              .read<CategoryProductsCubit>()
                              .decrementQuantity(productIndex);
                        },
                        onAddToCart: (int productIndex) {
                          final cubit = context.read<CategoryProductsCubit>();
                          final product =
                              cubit.state.category!.products[productIndex];
                          final quantity = cubit.state.quantityFor(
                            productIndex,
                          );

                          context.read<CartCubit>().addToCart(
                            product.id,
                            quantity,
                          );

                          cubit.addToCart(productIndex);
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
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: CategoryProductsHeader(
                  category: state.category!,
                  cartCount: state.cartCount,
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
                ),
              ),
              if (state.cartCount > 0)
                Positioned(
                  right: 16.w,
                  left: 16.w,
                  bottom: 16.h,
                  child: SafeArea(
                    top: false,
                    child: CategoryProductsViewCartButton(
                      cartCount: state.cartCount,
                      onPressed: () {
                        context.pop('go_to_cart_tab');
                      },
                    ),
                  ),
                ),
              if (state.isLoading && state.category != null)
                Positioned.fill(child: CustomLoading.showLoader()),
            ],
          ),
        );
      },
    );
  }
}
