import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/di/services_locator.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/all_popular_products_screen_body.dart';

class AllPopularProductsScreen extends StatelessWidget {
  const AllPopularProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FB),
      body: BlocProvider<CustomerHomeCubit>(
        create: (context) => sl<CustomerHomeCubit>(),
        child: const AllPopularProductsScreenBody(),
      ),
    );
  }
}
