import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/di/services_locator.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/checkout_cubit/checkout_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_screen_body.dart';

class CheckoutScreen extends StatelessWidget {
  final String? promoCode;
  const CheckoutScreen({super.key, this.promoCode});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<CheckoutCubit>()..getScheduledTimes(),
        ),
        BlocProvider(
          create: (context) => sl<AddressCubit>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        body: CheckoutScreenBody(promoCode: promoCode),
      ),
    );
  }
}