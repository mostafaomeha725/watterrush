import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_snack_bar.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/core/widgets/navbar_page_app_bar.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_offers/presentation/screens/widgets/offer_coupon_card.dart';
import 'package:waterrush/features/custoomer/customer_offers/presentation/screens/widgets/offers_how_to_use_section.dart';
import 'package:waterrush/features/custoomer/customer_offers/presentation/screens/widgets/offers_launch_banner.dart';
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

  static final List<OfferSliderItemData> _launchOffers = <OfferSliderItemData>[
    OfferSliderItemData(
      title: 'Launch Week Deal',
      subtitle: 'Get up to 20% off on selected water bundles',
      imagePath: Assets.logo,
      colors: const <Color>[Color(0xFF1F67C5), Color(0xFF0E8AD8)],
      flashDealLabel: 'Launch Offer',
      discountLabel: '20% OFF',
      validUntil: DateTime(2026, 4, 30),
      terms: const <String>[
        'Valid for first 3 orders',
        'Selected products only',
        'Cannot be combined with other coupons',
      ],
      products: const <OfferProductItemData>[
        OfferProductItemData(
          name: 'Aquafina 500ml Pack',
          subtitle: 'Aquafina · 12 bottles',
          imageUrl:
              'https://images.unsplash.com/photo-1559839914-17aae19cec71?auto=format&fit=crop&w=1200&q=80',
          currentPrice: 29,
          oldPrice: 36,
          saveAmount: 7,
          rating: 4.7,
          reviewsCount: 145,
          discountLabel: '-20%',
          isPopular: true,
          isOnOffer: true,
        ),
        OfferProductItemData(
          name: 'Nestle Pure Life',
          subtitle: 'Nestle · 12 bottles',
          imageUrl:
              'https://images.unsplash.com/photo-1616118132534-381148898bb4?auto=format&fit=crop&w=1200&q=80',
          currentPrice: 26,
          oldPrice: 33,
          saveAmount: 7,
          rating: 4.6,
          reviewsCount: 118,
          discountLabel: '-20%',
          isOnOffer: true,
        ),
      ],
    ),
    OfferSliderItemData(
      title: 'Free Delivery Bundle',
      subtitle: 'Save on delivery for office and family packs',
      imagePath: Assets.logo,
      colors: const <Color>[Color(0xFF1E5BB2), Color(0xFF2F93EA)],
      flashDealLabel: 'Member Deal',
      discountLabel: '15% OFF',
      validUntil: DateTime(2026, 5, 6),
      terms: const <String>[
        'Minimum order value applies',
        'Available in major cities',
        'One active code per order',
      ],
      products: const <OfferProductItemData>[
        OfferProductItemData(
          name: 'Family Carton Combo',
          subtitle: 'Combo · 24 bottles',
          imageUrl:
              'https://images.unsplash.com/photo-1523362628745-0c100150b504?auto=format&fit=crop&w=1200&q=80',
          currentPrice: 57,
          oldPrice: 67,
          saveAmount: 10,
          rating: 4.8,
          reviewsCount: 97,
          discountLabel: '-15%',
          isPopular: true,
          isOnOffer: true,
        ),
        OfferProductItemData(
          name: 'Office Hydration Pack',
          subtitle: 'Office set · 6 gallons',
          imageUrl:
              'https://images.unsplash.com/photo-1502740479091-635887520276?auto=format&fit=crop&w=1200&q=80',
          currentPrice: 95,
          oldPrice: 112,
          saveAmount: 17,
          rating: 4.7,
          reviewsCount: 74,
          discountLabel: '-15%',
          isOnOffer: true,
        ),
      ],
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
            OffersLaunchBanner(
              onClaimNow: () {
                context.push(Routes.specialOffersScreen, extra: CustomerOffersScreen._launchOffers);
              },
            ),
            SizedBox(height: 14.h),
            AppText(
              'Available Offers',
              style: font18w700.copyWith(color: const Color(0xFF0F2B46)),
            ),
            SizedBox(height: 10.h),
            BlocBuilder<OffersCubit, OffersState>(
              builder: (context, state) {
                if (state is OffersLoading || state is OffersInitial) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is OffersError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                if (state is OffersLoaded) {
                  final promoCodes = state.promoCodes;

                  if (promoCodes.isEmpty) {
                    return const Center(child: Text('No offers available right now'));
                  }

                  return Column(
                    children: promoCodes.map((promo) {
                      final isPercent = promo.type == 'percent';
                      final discountText = isPercent ? '${promo.discount}% OFF' : '\$${promo.discount} OFF';

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
                            await Clipboard.setData(ClipboardData(text: offerItem.code));
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