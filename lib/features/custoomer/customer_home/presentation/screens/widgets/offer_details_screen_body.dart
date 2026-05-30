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

class OfferDetailsScreenBody extends StatelessWidget {
  const OfferDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferDetailsCubit, OfferDetailsState>(
      builder: (BuildContext context, OfferDetailsState state) {
        if (state.isLoading) {
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
                            'Products in this offer (${state.offer!.products.length})',
                            style: font18w700.copyWith(
                              color: const Color(0xFF102A43),
                            ),
                          ),
                          verticalSpacing(10),
                          ...List<Widget>.generate(
                            state.offer!.products.length,
                            (int index) => Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: OfferProductCard(
                                product: state.offer!.products[index],
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
                                  context.read<OfferDetailsCubit>().addToCart(
                                    index,
                                  );
                                },
                              ),
                            ),
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
            ],
          ),
        );
      },
    );
  }
}