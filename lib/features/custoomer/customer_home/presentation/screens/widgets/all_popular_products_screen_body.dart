import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/category_products_cubit/category_products_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/all_popular_products_app_bar.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/all_popular_products_main_content.dart';

class AllPopularProductsScreenBody extends StatefulWidget {
  const AllPopularProductsScreenBody({super.key});

  @override
  State<AllPopularProductsScreenBody> createState() =>
      _AllPopularProductsScreenBodyState();
}

class _AllPopularProductsScreenBodyState
    extends State<AllPopularProductsScreenBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CustomerHomeCubit>().getPopularProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          // Custom App Bar
          const AllPopularProductsAppBar(),

          Expanded(
            child: BlocBuilder<CustomerHomeCubit, CustomerHomeState>(
              builder: (BuildContext context, CustomerHomeState state) {
                if (state.popularProductsStatus == CustomerHomeStatus.loading ||
                    state.popularProductsStatus == CustomerHomeStatus.initial) {
                  return Center(child: CustomLoading.showLoader());
                }

                if (state.popularProducts.isEmpty) {
                  return Center(
                    child: AppText(
                      'No popular products found',
                      style: font16w500.copyWith(color: Colors.grey),
                    ),
                  );
                }

                final List<OfferProductItemData> mappedProducts = state
                    .popularProducts
                    .map((product) {
                      final bool hasDiscount =
                          product.priceBefore != null &&
                          product.priceBefore! > product.price;
                      final int discountPercentage = hasDiscount
                          ? (((product.priceBefore! - product.price) /
                                        product.priceBefore!) *
                                    100)
                                .round()
                          : 0;

                      return OfferProductItemData(
                        id: product.id,
                        name: product.title,
                        subtitle: product.description,
                        imageUrl: product.images.isNotEmpty
                            ? product.images.first.image
                            : '',
                        currentPrice: product.price,
                        oldPrice: product.priceBefore ?? product.price,
                        saveAmount: product.priceBefore != null
                            ? (product.priceBefore! - product.price).toInt()
                            : 0,
                        rating: 5.0, // Dummy rating
                        reviewsCount: 0, // Dummy reviews
                        discountLabel: hasDiscount
                            ? '-$discountPercentage%'
                            : '',
                        isPopular: true,
                        isAvailable: product.available,
                      );
                    })
                    .toList();

                List<OfferProductItemData> visibleProducts = mappedProducts
                    .where((p) {
                      return !state.popularProductsShowOnOfferOnly ||
                          p.isOnOffer ||
                          p.oldPrice > p.currentPrice;
                    })
                    .toList();

                visibleProducts.sort((first, second) {
                  switch (state.popularProductsSort) {
                    case CategoryProductsSort.popular:
                      if (first.isPopular != second.isPopular) {
                        return second.isPopular ? 1 : -1;
                      }
                      return second.rating.compareTo(first.rating);
                    case CategoryProductsSort.priceLowToHigh:
                      return first.currentPrice.compareTo(second.currentPrice);
                    case CategoryProductsSort.priceHighToLow:
                      return second.currentPrice.compareTo(first.currentPrice);
                    case CategoryProductsSort.topRated:
                      final int ratingCompare = second.rating.compareTo(
                        first.rating,
                      );
                      if (ratingCompare != 0) return ratingCompare;
                      return second.reviewsCount.compareTo(first.reviewsCount);
                  }
                });

                return AllPopularProductsMainContent(
                  state: state,
                  visibleProducts: visibleProducts,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
