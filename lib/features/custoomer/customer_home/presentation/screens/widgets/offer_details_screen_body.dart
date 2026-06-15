import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/offer_details_cubit/offer_details_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/offer_details_cubit/offer_details_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_details_header.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_product_card.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_terms_card.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/core/widgets/pagination_widget.dart';

class OfferDetailsScreenBody extends StatelessWidget {
  const OfferDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferDetailsCubit, OfferDetailsState>(
      builder: (BuildContext context, OfferDetailsState state) {
        if (state.isLoading && state.offer == null) {
          return Center(child: CustomLoading.showLoader());
        }

        if (state.offer == null) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppText(
                    'Offer data is unavailable.',
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

        final double headerPlaceholderHeight = 228.h;

        return SafeArea(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 112.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: headerPlaceholderHeight + 14.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          OfferTermsCard(terms: state.offer!.terms),
                          verticalSpacing(14),
                          AppText(
                            'Products in this offer (${state.apiProducts.length})',
                            style: font18w700.copyWith(
                              color: const Color(0xFF102A43),
                            ),
                          ),
                          verticalSpacing(10),
                          if (state.errorMessage != null)
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Center(
                                child: AppText(
                                  state.errorMessage!,
                                  style: font14w400.copyWith(color: Colors.red),
                                ),
                              ),
                            )
                          else if (state.apiProducts.isEmpty)
                            Container(
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
                                    'No products available for this offer.',
                                    style: font14w700.copyWith(color: const Color(0xFF23405F)),
                                    alignment: AlignmentDirectional.center,
                                  ),
                                  verticalSpacing(12),
                                  AppButton(
                                    text: 'Show Popular Products',
                                    onPressed: () => context.pushReplacement(Routes.allPopularProductsScreen),
                                    color: const Color(0xFF1178DD),
                                    textSize: 13.sp,
                                    radius: 10.r,
                                  ),
                                ],
                              ),
                            )
                          else
                            ...List<Widget>.generate(
                              state.apiProducts.length,
                              (int index) {
                                final productData = state.apiProducts[index].toOfferProductItemData();
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: GestureDetector(
                                    onTap: () async {
                                      final result = await context.push(
                                        Routes.productDetailsScreen,
                                        extra: productData.id,
                                      );
                                      if (result == 'go_to_cart_tab' && context.mounted) {
                                        context.pop('go_to_cart_tab');
                                      }
                                    },
                                    child: OfferProductCard(
                                      product: productData,
                                      compactLayout: true,
                                      quantity: state.quantityFor(index),
                                      onIncrement: () {
                                        context
                                            .read<OfferDetailsCubit>()
                                            .incrementQuantity(index);
                                      },
                                      onDecrement: () {
                                        context
                                            .read<OfferDetailsCubit>()
                                            .decrementQuantity(index);
                                      },
                                      onAddToCart: () {
                                        final cubit = context.read<OfferDetailsCubit>();
                                        final product = state.apiProducts[index];
                                        final quantity = state.quantityFor(index);

                                        context.read<CartCubit>().addToCart(
                                          product.id,
                                          quantity,
                                        );
                                        cubit.addToCart(index);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          if (state.lastPage > 1 && state.apiProducts.length > 1)
                            PaginationWidget(
                              totalPages: state.lastPage,
                              currentPage: state.currentPage,
                              onPageChanged: (page) {
                                context.read<OfferDetailsCubit>().loadPage(page);
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: OfferDetailsHeader(
                  offer: state.offer!,
                  cartCount: state.cartCount,
                  onBackTap: context.pop,
                  onCartTap: () {
                    context.pop('go_to_cart_tab');
                  },
                ),
              ),
              if (state.cartCount > 0)
                Positioned(
                  right: 22.w,
                  left: 22.w,
                  bottom: 16.h,
                  child: SafeArea(
                    top: false,
                    child: AppButton.icon(
                      text: 'View Cart (${state.cartCount})',
                      onPressed: () {
                        context.pop('go_to_cart_tab');
                      },

                      color: const Color(0xFF1178DD),
                      radius: 14.r,
                      height: 50.h,
                      textSize: 16.sp,
                      textWeight: FontWeight.w700,
                      child: Icon(
                        Icons.shopping_cart_checkout_rounded,
                        size: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (state.isLoading && state.offer != null)
                Positioned.fill(child: CustomLoading.showLoader()),
            ],
          ),
        );
      },
    );
  }
}
