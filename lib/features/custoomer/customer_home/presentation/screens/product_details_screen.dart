import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/di/services_locator.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/product_details_cubit/product_details_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/product_details_screen_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FB),
      body: BlocProvider<ProductDetailsCubit>(
        create: (BuildContext context) =>
            sl<ProductDetailsCubit>(param1: productId),
        child: const ProductDetailsScreenBody(),
      ),
    );
  }
}
