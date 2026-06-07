import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/all_categories_header.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/all_categories_list_section.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class AllCategoriesScreenBody extends StatelessWidget {
  const AllCategoriesScreenBody({super.key, required this.categories});

  final List<CategoryItemData> categories;

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppText(
                'No categories available right now.',
                style: font16w700.copyWith(color: const Color(0xFF1D3D60)),
                alignment: AlignmentDirectional.center,
              ),
              verticalSpacing(12),
              AppButton(
                text: 'Back',
                onPressed: context.pop,
                color: const Color(0xFF1177DD),
                radius: 14.r,
                textSize: 14.sp,
              ),
            ],
          ),
        ),
      );
    }

    final int totalProducts = categories.fold<int>(
      0,
      (int sum, CategoryItemData category) => sum + category.products.length,
    );
    final int totalOnOffer = categories.fold<int>(
      0,
      (int sum, CategoryItemData category) => sum + category.onOfferCount,
    );
    final double pinnedHeaderHeight = 210.h;

    return SafeArea(
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 18.h),
            child: Column(
              children: <Widget>[
                SizedBox(height: pinnedHeaderHeight + 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: AllCategoriesListSection(
                    categories: categories,
                    onBrowse: (CategoryItemData category) async {
                      final dynamic result = await context.push(
                        Routes.categoryProductsScreen,
                        extra: category,
                      );

                      if (!context.mounted) {
                        return;
                      }

                      if (result == 'go_to_cart_tab') {
                        context.pop('go_to_cart_tab');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AllCategoriesHeader(
              categoriesCount: categories.length,
              totalProductsCount: totalProducts,
              onOfferCount: totalOnOffer,
            ),
          ),
        ],
      ),
    );
  }
}
