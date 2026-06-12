import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_categories_row.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_greeting_card.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_mock_data.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_offer_section_card.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_popular_products_section.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_section_header.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_top_bar.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_trust_row.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_view_models.dart';
import 'package:waterrush/core/widgets/custom_nav_bar.dart';

class CustomerHomeBodyContent extends StatelessWidget {
  const CustomerHomeBodyContent({
    required this.cubit,
    required this.routeCategories,
    required this.displayCategories,
    super.key,
  });

  final CustomerHomeCubit cubit;
  final List<CategoryItemData> routeCategories;
  final List<HomeCategoryViewModel> displayCategories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomerHomeTopBar(
            onNotificationTap: () {},
            onProfileTap: () => CustomNavBar.switchToTab(context, 4),
          ),
          SizedBox(height: 14.h),
          const CustomerHomeGreetingCard(),
          SizedBox(height: 12.h),
          CustomerHomeOfferSectionCard(
            cubit: cubit,
            onBannerButtonTap: (slider) async {
              final text = slider.buttonText.trim().toLowerCase();
              Object? result;
              if (text == 'shop now') {
                result = await context.push(
                  Routes.allCategoriesScreen,
                  extra: routeCategories,
                );
              } else if (text == 'get yours') {
                result = await context.push(Routes.allPopularProductsScreen);
              } else {
                // Default / 'Order Now'
                result = await context.push(
                  Routes.specialOffersScreen,
                  extra: customerHomeOffers,
                );
              }
              
              if (result == 'go_to_cart_tab' && context.mounted) {
                CustomNavBar.switchToTab(context, 2);
              }
            },
          ),
          SizedBox(height: 14.h),
          CustomerHomeSectionHeader(
            title: 'Shop by Category',
            onSeeAll: () async {
              final result = await context.push(
                Routes.allCategoriesScreen,
                extra: routeCategories,
              );
              if (result == 'go_to_cart_tab' && context.mounted) {
                CustomNavBar.switchToTab(context, 2);
              }
            },
          ),
          SizedBox(height: 10.h),
          CustomerHomeCategoriesRow(
            categories: displayCategories,
            onCategoryTap: (int index) async {
              final result = await context.push(
                Routes.categoryProductsScreen,
                extra: routeCategories[index],
              );
              if (result == 'go_to_cart_tab' && context.mounted) {
                CustomNavBar.switchToTab(context, 2);
              }
            },
          ),
          SizedBox(height: 14.h),
          const CustomerHomePopularProductsSection(),
          SizedBox(height: 12.h),
          //  CustomerHomeReorderCard(onReorder: cubit.reorderLastOrder),
          SizedBox(height: 12.h),
          CustomerHomeTrustRow(
            items: customerHomeBottomTrustItems,
            cardColor: const Color(0xFFF8FBFF),
            isCompact: true,
          ),
        ],
      ),
    );
  }
}
