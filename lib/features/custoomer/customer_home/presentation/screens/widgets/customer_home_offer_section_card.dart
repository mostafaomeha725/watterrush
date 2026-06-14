import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_cubit.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_offer_banner.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_offer_banner_indicator.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/entities/slider_entity.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_state.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CustomerHomeOfferSectionCard extends StatelessWidget {
  const CustomerHomeOfferSectionCard({
    required this.cubit,
    required this.onBannerButtonTap,
    super.key,
  });

  final CustomerHomeCubit cubit;
  final void Function(SliderEntity) onBannerButtonTap;

  @override
  Widget build(BuildContext context) {
    if (cubit.state.slidersStatus == CustomerHomeStatus.loading) {
      return SizedBox(
        height: 280.h,
        child: Center(child: CustomLoading.showLoader(scale: 0.7)),
      );
    }

    if (cubit.state.sliders.isEmpty) {
      return SizedBox(
        height: 80.h,
        child: Center(
          child: AppText(
            cubit.state.message.isNotEmpty
                ? cubit.state.message
                : 'No data available at the moment',
            color: const Color(0xFF102A43),
            alignment: AlignmentDirectional.center,

            fontSize: 14.sp,
          ),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 280.h,
          child: PageView.builder(
            controller: cubit.bannerController,
            clipBehavior: Clip.none,
            itemCount: cubit.state.sliders.length,
            onPageChanged: cubit.onBannerChanged,
            itemBuilder: (context, index) {
              final slider = cubit.state.sliders[index];

              return CustomerHomeOfferBanner(
                slider: slider,
                onOrderNow: () => onBannerButtonTap(slider),
              );
            },
          ),
        ),
        SizedBox(height: 8.h),
        CustomerHomeOfferBannerIndicator(
          itemCount: cubit.state.sliders.length,
          currentIndex: cubit.state.currentBannerIndex,
        ),
      ],
    );
  }
}
