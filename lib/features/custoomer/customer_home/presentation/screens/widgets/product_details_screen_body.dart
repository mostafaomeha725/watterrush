import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/product_details_cubit/product_details_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/product_details_cubit/product_details_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/product_details_app_bar.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/product_details_image.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/product_details_info.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/product_details_bottom_bar.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/product_details_floating_cart.dart';

class ProductDetailsScreenBody extends StatelessWidget {
  const ProductDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (BuildContext context, ProductDetailsState state) {
        if (state.status == ProductDetailsStatus.loading ||
            state.status == ProductDetailsStatus.initial) {
          return Center(child: CustomLoading.showLoader());
        }

        if (state.status == ProductDetailsStatus.failure) {
          return Center(
            child: AppText(
              state.message,
              style: font16w500.copyWith(color: Colors.red),
            ),
          );
        }

        final product = state.product!;
        final bool hasDiscount =
            product.priceBefore != null && product.priceBefore! > product.price;

        String imageUrl = '';
        if (product.images.isNotEmpty) {
          imageUrl = product.images.first.image;
        }

        return SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  const ProductDetailsAppBar(),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ProductDetailsImage(
                            imageUrl: imageUrl,
                            isAvailable: product.available,
                          ),
                          SizedBox(height: 24.h),
                          ProductDetailsInfo(
                            title: product.title,
                            description: product.description,
                            price: product.price,
                            priceBefore: product.priceBefore,
                            hasDiscount: hasDiscount,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ProductDetailsBottomBar(
                    productId: product.id,
                    isAvailable: product.available,
                  ),
                ],
              ),
              const ProductDetailsFloatingCart(),
            ],
          ),
        );
      },
    );
  }
}

