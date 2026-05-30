import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_mock_data.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_offer_banner.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_offer_banner_indicator.dart';

class CustomerHomeOfferSectionCard extends StatelessWidget {
  const CustomerHomeOfferSectionCard({
    required this.cubit,
    required this.onOrderNow,
    super.key,
  });

  final CustomerHomeCubit cubit;
  final VoidCallback onOrderNow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 280.h,
          child: PageView.builder(
            controller: cubit.bannerController,
            clipBehavior: Clip.none,
            itemCount: cubit.state.sliders.isNotEmpty 
                ? cubit.state.sliders.length 
                : customerHomeBanners.length,
            onPageChanged: cubit.onBannerChanged,
            itemBuilder: (context, index) {
              final data = customerHomeBanners[index % customerHomeBanners.length];
              final slider = cubit.state.sliders.isNotEmpty ? cubit.state.sliders[index] : null;

              return CustomerHomeOfferBanner(
                data: data,
                slider: slider,
                onOrderNow: onOrderNow,
              );
            },
          ),
        ),
        SizedBox(height: 8.h),
        CustomerHomeOfferBannerIndicator(
          itemCount: cubit.state.sliders.isNotEmpty 
              ? cubit.state.sliders.length 
              : customerHomeBanners.length,
          currentIndex: cubit.state.currentBannerIndex,
        ),
      ],
    );
  }
}