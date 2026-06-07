import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/special_offer_list_card.dart';

class SpecialOffersListSection extends StatelessWidget {
  const SpecialOffersListSection({
    super.key,
    required this.offers,
    required this.onOfferTap,
  });

  final List<OfferSliderItemData> offers;
  final ValueChanged<OfferSliderItemData> onOfferTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: offers
          .map(
            (OfferSliderItemData offer) => Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: SpecialOfferListCard(
                offer: offer,
                onTap: () => onOfferTap(offer),
              ),
            ),
          )
          .toList(),
    );
  }
}
