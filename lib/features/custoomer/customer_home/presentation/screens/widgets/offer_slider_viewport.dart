import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_slider_card.dart';

class OfferSliderViewport extends StatelessWidget {
  const OfferSliderViewport({
    super.key,
    required this.offerSliderWidth,
    required this.controller,
    required this.sliderOffers,
    required this.onPageChanged,
    required this.onOfferTap,
  });

  final double offerSliderWidth;
  final PageController controller;
  final List<OfferSliderItemData> sliderOffers;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<int> onOfferTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: OverflowBox(
        minWidth: offerSliderWidth,
        maxWidth: offerSliderWidth,
        alignment: Alignment.center,
        child: SizedBox(
          width: offerSliderWidth,
          child: PageView.builder(
            controller: controller,
            itemCount: sliderOffers.length,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              return OfferSliderCard(
                data: sliderOffers[index],
                onTap: () {
                  onOfferTap(index);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
