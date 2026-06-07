import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/special_offer_list_card.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/special_offers_empty_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/special_offers_header.dart';

class SpecialOffersScreenBody extends StatelessWidget {
  const SpecialOffersScreenBody({super.key, required this.offers});

  final List<OfferSliderItemData> offers;

  @override
  Widget build(BuildContext context) {
    if (offers.isEmpty) {
      return const SpecialOffersEmptyState();
    }

    final int maxDiscount = offers
        .map(
          (OfferSliderItemData offer) =>
              int.tryParse(
                RegExp(r'\d+').firstMatch(offer.discountLabel)?.group(0) ?? '0',
              ) ??
              0,
        )
        .fold<int>(0, (int currentMax, int value) {
          return value > currentMax ? value : currentMax;
        });

    return Column(
      children: <Widget>[
        SpecialOffersHeader(
          activeDealsCount: offers.length,
          maxDiscount: maxDiscount,
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            itemCount: offers.length,
            separatorBuilder: (BuildContext ctx, int _) =>
                SizedBox(height: 14.h),
            itemBuilder: (BuildContext ctx, int i) {
              final OfferSliderItemData offer = offers[i];
              return SpecialOfferListCard(
                offer: offer,
                onTap: () async {
                  final dynamic result = await context.push(
                    Routes.offerDetailsScreen,
                    extra: offer,
                  );
                  if (!context.mounted) return;
                  if (result == 'go_to_cart_tab') {
                    context.pop('go_to_cart_tab');
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
