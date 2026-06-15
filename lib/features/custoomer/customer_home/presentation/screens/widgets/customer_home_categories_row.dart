import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_category_card.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_view_models.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CustomerHomeCategoriesRow extends StatelessWidget {
  const CustomerHomeCategoriesRow({
    required this.categories,
    required this.onCategoryTap,
    this.isLoading = false,
    this.errorMessage,
    super.key,
  });

  final List<HomeCategoryViewModel> categories;
  final ValueChanged<int> onCategoryTap;
  final bool isLoading;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 140.h,
        child: Center(child: CustomLoading.showLoader(scale: 0.7)),
      );
    }

    if (categories.isEmpty) {
      return SizedBox(
        height: 80.h,
        child: Center(
          child: AppText(
            errorMessage != null && errorMessage!.isNotEmpty
                ? errorMessage!
                : 'No data available at the moment',
            color: const Color(0xFF102A43),
            alignment: AlignmentDirectional.center,
            fontSize: 14.sp,
          ),
        ),
      );
    }

    return SizedBox(
      height: 260.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        clipBehavior: Clip.none,
        itemBuilder: (BuildContext context, int index) {
          return CustomerHomeCategoryCard(
            data: categories[index],
            onTap: () => onCategoryTap(index),
          );
        },
      ),
    );
  }
}
