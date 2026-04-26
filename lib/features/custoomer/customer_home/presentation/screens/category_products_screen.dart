import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/category_products_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/category_products_screen_body.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.category});

  final CategoryItemData? category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FB),
      body: BlocProvider<CategoryProductsCubit>(
        create: (BuildContext context) =>
            CategoryProductsCubit(category: category),
        child: const CategoryProductsScreenBody(),
      ),
    );
  }
}
