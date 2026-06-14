import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_snack_bar.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/navbar_page_app_bar.dart';
import 'package:waterrush/features/custoomer/customer_offers/presentation/screens/widgets/offer_coupon_card.dart';
import 'package:waterrush/features/custoomer/customer_offers/presentation/screens/widgets/offers_how_to_use_section.dart';
import 'package:waterrush/features/custoomer/customer_offers/presentation/screens/widgets/offers_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/di/services_locator.dart';
import 'package:waterrush/features/custoomer/customer_offers/presentation/cubit/offers_cubit.dart';
import 'package:waterrush/features/custoomer/customer_offers/presentation/cubit/offers_state.dart';

class CustomerOffersScreen extends StatelessWidget {
  const CustomerOffersScreen({super.key});

  static const List<OfferStepModel> _steps = <OfferStepModel>[
    OfferStepModel(
      step: 1,
      title: 'Add items to cart',
      subtitle: 'Choose your water products',
    ),
    OfferStepModel(
      step: 2,
      title: 'Apply promo code',
      subtitle: 'Enter code at checkout',
    ),
    OfferStepModel(
      step: 3,
      title: 'Enjoy savings',
      subtitle: 'Get instant discount on order',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OffersCubit>()..getPromoCodes(),
      child: const CustomerOffersScreenBody(),
    );
  }
}

class CustomerOffersScreenBody extends StatelessWidget {
  const CustomerOffersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavBarPageAppBar(
              title: 'Offers',
              subtitle: 'Exclusive discounts and promo codes',
              leadingIcon: Icons.local_offer_rounded,
            ),
            // OffersLaunchBanner(
            //   onClaimNow: () {
            //     context.push(
            //       Routes.specialOffersScreen,
            //       extra: CustomerOffersScreen._launchOffers,
            //     );
            //   },
            // ),
            SizedBox(height: 14.h),
            AppText(
              'Available Offers',
              style: font18w700.copyWith(color: const Color(0xFF0F2B46)),
            ),
            SizedBox(height: 10.h),
            BlocBuilder<OffersCubit, OffersState>(
              builder: (context, state) {
                if (state is OffersLoading || state is OffersInitial) {
                  return SizedBox(
                    height: 200.h,
                    child: Center(child: CustomLoading.showLoader(scale: 0.7)),
                  );
                }

                if (state is OffersError) {
                  return SizedBox(
                    height: 200.h,
                    child: Center(
                      child: AppText(
                        state.message,
                        color: Colors.red,
                        fontSize: 14.sp,
                      ),
                    ),
                  );
                }

                if (state is OffersLoaded) {
                  final promoCodes = state.promoCodes;

                  if (promoCodes.isEmpty) {
                    return SizedBox(
                      height: 200.h,
                      child: Center(
                        child: AppText(
                          'No offers available right now',
                          color: const Color(0xFF102A43),
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }

                  return Column(
                    children: promoCodes.map((promo) {
                      final isPercent = promo.type == 'percent' || promo.type == 'percentage';
                      final discountText = isPercent
                          ? '${promo.discount}% OFF'
                          : '${promo.discount} AED OFF';

                      final offerItem = OfferItemModel(
                        title: discountText,
                        subtitle: 'Special Discount',
                        validText: 'Valid till ${promo.expiresAt}',
                        code: promo.code,
                        accentColor: const Color(0xFF14AED3),
                        icon: Icons.local_offer_rounded,
                      );

                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: OfferCouponCard(
                          item: offerItem,
                          onCopy: () async {
                            await Clipboard.setData(
                              ClipboardData(text: offerItem.code),
                            );
                            if (context.mounted) {
                              CustomSnackBar.showSuccess(
                                context,
                                message: 'Code ${offerItem.code} copied',
                              );
                            }
                          },
                        ),
                      );
                    }).toList(),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            SizedBox(height: 8.h),
            OffersHowToUseSection(steps: CustomerOffersScreen._steps),
            SizedBox(height: 104.h),
          ],
        ),
      ),
    );
  }
}
