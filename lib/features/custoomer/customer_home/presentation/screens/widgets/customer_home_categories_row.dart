import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_category_card.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_view_models.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';

class CustomerHomeCategoriesRow extends StatelessWidget {
  const CustomerHomeCategoriesRow({
    required this.categories,
    required this.onCategoryTap,
    super.key,
  });

  final List<HomeCategoryViewModel> categories;
  final ValueChanged<int> onCategoryTap;

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return SizedBox(
        height: 140.h,
        child: Center(child: CustomLoading.showLoader(scale: 0.7)),
      );
    }

    return Row(
      children: List<Widget>.generate(categories.length, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              end: index == categories.length - 1 ? 0 : 8.w,
            ),
            child: CustomerHomeCategoryCard(
              data: categories[index],
              onTap: () => onCategoryTap(index),
            ),
          ),
        );
      }),
    );
  }
}
