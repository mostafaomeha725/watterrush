import 'package:flutter/material.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/all_categories_screen_body.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key, required this.categories});

  final List<CategoryItemData> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FB),
      body: AllCategoriesScreenBody(categories: categories),
    );
  }
}