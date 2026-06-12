import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/easy_loading.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_product_card.dart';
import 'package:waterrush/core/widgets/pagination_widget.dart';

class AllPopularProductsScreenBody extends StatefulWidget {
  const AllPopularProductsScreenBody({super.key});

  @override
  State<AllPopularProductsScreenBody> createState() =>
      _AllPopularProductsScreenBodyState();
}

class _AllPopularProductsScreenBodyState
    extends State<AllPopularProductsScreenBody> {
  // Store quantities for each product
  final Map<int, int> _quantities = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          // Custom App Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_rounded, size: 20.sp),
                  onPressed: () => context.pop(),
                ),
                Expanded(
                  child: AppText(
                    'All Popular Products',
                    alignment: AlignmentDirectional.center,
                    style: font18w700.copyWith(color: const Color(0xFF223A66)),
                  ),
                ),
                SizedBox(width: 40.w), // Balance for back button
              ],
            ),
          ),

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

                final listView = ListView.separated(
                  padding: EdgeInsets.all(16.w),
                  itemCount: state.popularProducts.length,
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemBuilder: (BuildContext context, int index) {
                    final product = state.popularProducts[index];
                    final bool hasDiscount =
                        product.priceBefore != null &&
                        product.priceBefore! > product.price;
                    final int discountPercentage = hasDiscount
                        ? (((product.priceBefore! - product.price) /
                                      product.priceBefore!) *
                                  100)
                              .round()
                        : 0;

                    final OfferProductItemData mappedProduct =
                        OfferProductItemData(
                          id: product.id,
                          name: product.title,
                          subtitle: '', // No subtitle available
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
                        );

                    final quantity = _quantities[product.id] ?? 1;

                    return GestureDetector(
                      onTap: () => context.push(
                        Routes.productDetailsScreen,
                        extra: product.id,
                      ),
                      child: OfferProductCard(
                        product: mappedProduct,
                        quantity: quantity,
                        compactLayout: true,
                        onIncrement: () {
                          setState(() {
                            _quantities[product.id] = quantity + 1;
                          });
                        },
                        onDecrement: () {
                          if (quantity > 1) {
                            setState(() {
                              _quantities[product.id] = quantity - 1;
                            });
                          }
                        },
                        onAddToCart: () {
                          context.read<CartCubit>().addToCart(
                            product.id,
                            quantity,
                          );
                        },
                      ),
                    );
                  },
                );

                return Column(
                  children: [
                    Expanded(child: listView),
                    if (state.popularProductsLastPage > 1)
                      PaginationWidget(
                        totalPages: state.popularProductsLastPage,
                        currentPage: state.popularProductsCurrentPage,
                        onPageChanged: (page) {
                          context.read<CustomerHomeCubit>().getPopularProducts(
                            page: page,
                          );
                        },
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
