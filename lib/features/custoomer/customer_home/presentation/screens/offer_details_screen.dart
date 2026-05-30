import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/offer_details_cubit/offer_details_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_details_screen_body.dart';

class OfferDetailsScreen extends StatelessWidget {
  const OfferDetailsScreen({super.key, required this.offer});

  final OfferSliderItemData? offer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FB),
      body: BlocProvider<OfferDetailsCubit>(
        create: (BuildContext context) => OfferDetailsCubit(offer: offer),
        child: const OfferDetailsScreenBody(),
      ),
    );
  }
}