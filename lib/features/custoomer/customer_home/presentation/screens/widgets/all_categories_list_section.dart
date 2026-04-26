import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/all_categories_list_card.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class AllCategoriesListSection extends StatelessWidget {
  const AllCategoriesListSection({
    super.key,
    required this.categories,
    required this.onBrowse,
  });

  final List<CategoryItemData> categories;
  final ValueChanged<CategoryItemData> onBrowse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: categories
          .map(
            (CategoryItemData category) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: AllCategoriesListCard(
                category: category,
                onBrowse: () => onBrowse(category),
              ),
            ),
          )
          .toList(),
    );
  }
}
