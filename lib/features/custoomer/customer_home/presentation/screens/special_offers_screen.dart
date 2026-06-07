import 'package:flutter/material.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/special_offers_screen_body.dart';

class SpecialOffersScreen extends StatelessWidget {
  const SpecialOffersScreen({super.key, required this.offers});

  final List<OfferSliderItemData> offers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FB),
      body: SpecialOffersScreenBody(offers: offers),
    );
  }
}
