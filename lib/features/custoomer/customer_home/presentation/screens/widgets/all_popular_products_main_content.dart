import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/widgets/pagination_widget.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/category_products_filters_row.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/category_products_view_cart_button.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/all_popular_products_list.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class AllPopularProductsMainContent extends StatelessWidget {
  const AllPopularProductsMainContent({
    super.key,
    required this.state,
    required this.visibleProducts,
  });

  final CustomerHomeState state;
  final List<OfferProductItemData> visibleProducts;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        final listView = AllPopularProductsList(
          products: visibleProducts,
          cartState: cartState,
        );

        return Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: CategoryProductsFiltersRow(
                    showOnOfferOnly: state.popularProductsShowOnOfferOnly,
                    sort: state.popularProductsSort,
                    itemCount: visibleProducts.length,
                    onToggleOnOffer: () {
                      context.read<CustomerHomeCubit>().togglePopularProductsOnOffer();
                    },
                    onSortSelected: (sort) {
                      context.read<CustomerHomeCubit>().updatePopularProductsSort(sort);
                    },
                  ),
                ),
                Expanded(child: listView),
                if (state.popularProductsLastPage > 1)
                  PaginationWidget(
                    totalPages: state.popularProductsLastPage,
                    currentPage: state.popularProductsCurrentPage,
                    onPageChanged: (page) {
                      context.read<CustomerHomeCubit>().getPopularProducts(page: page);
                    },
                  ),
              ],
            ),
            if (cartState is CartLoaded && cartState.cart.items.isNotEmpty)
              Positioned(
                right: 16.w,
                left: 16.w,
                bottom: 16.h,
                child: SafeArea(
                  top: false,
                  child: CategoryProductsViewCartButton(
                    cartCount: cartState.cart.items.fold(
                      0,
                      (sum, item) => sum + item.quantity,
                    ),
                    onPressed: () {
                      context.pop('go_to_cart_tab');
                    },
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
