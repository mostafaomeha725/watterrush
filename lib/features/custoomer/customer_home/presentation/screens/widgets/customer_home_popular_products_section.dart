import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_popular_product_card.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_section_header.dart';

class CustomerHomePopularProductsSection extends StatelessWidget {
  const CustomerHomePopularProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerHomeCubit, CustomerHomeState>(
      builder: (BuildContext context, CustomerHomeState state) {
        if (state.popularProductsStatus == CustomerHomeStatus.initial &&
            state.popularProducts.isEmpty) {
          return const SizedBox();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomerHomeSectionHeader(
              title: 'Popular Products',
              onSeeAll: () {
                context.push(Routes.allPopularProductsScreen);
              },
            ),
            SizedBox(height: 12.h),
            if (state.popularProductsStatus == CustomerHomeStatus.loading)
              SizedBox(
                height: 200.h,
                child: Center(child: CustomLoading.showLoader()),
              )
            else
              SizedBox(
                height: 210.h, // Fixed height for horizontal list
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.popularProducts.length,
                  clipBehavior: Clip.none,
                  itemBuilder: (BuildContext context, int index) {
                    final product = state.popularProducts[index];
                    return CustomerHomePopularProductCard(
                      product: product,
                      onAddToCart: () {
                        // TODO: Implement add to cart action
                      },
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
