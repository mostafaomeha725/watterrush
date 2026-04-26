import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/customer_home_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_categories_row.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_greeting_card.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_mock_data.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_offer_section_card.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_reorder_card.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_section_header.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_top_bar.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_trust_row.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class CustomerHomeBodyContent extends StatelessWidget {
  const CustomerHomeBodyContent({
    required this.cubit,
    required this.routeCategories,
    super.key,
  });

  final CustomerHomeCubit cubit;
  final List<CategoryItemData> routeCategories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomerHomeTopBar(
            onNotificationTap: () {},
            onProfileTap: () => context.push(Routes.editProfileScreen),
          ),
          SizedBox(height: 14.h),
          const CustomerHomeGreetingCard(),
          SizedBox(height: 12.h),
          CustomerHomeOfferSectionCard(
            cubit: cubit,
            onOrderNow: () => context.push(
              Routes.specialOffersScreen,
              extra: customerHomeOffers,
            ),
          ),
          SizedBox(height: 14.h),
          CustomerHomeSectionHeader(
            title: 'Shop by Category',
            onSeeAll: () => context.push(
              Routes.allCategoriesScreen,
              extra: routeCategories,
            ),
          ),
          SizedBox(height: 10.h),
          CustomerHomeCategoriesRow(
            categories: customerHomeCategories,
            onCategoryTap: (index) => context.push(
              Routes.categoryProductsScreen,
              extra: routeCategories[index],
            ),
          ),
          SizedBox(height: 12.h),
          CustomerHomeReorderCard(onReorder: cubit.reorderLastOrder),
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
