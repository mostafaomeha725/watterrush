import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_image.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/product_details_cubit/product_details_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/product_details_cubit/product_details_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_product_card_actions.dart';

class ProductDetailsScreenBody extends StatefulWidget {
  const ProductDetailsScreenBody({super.key});

  @override
  State<ProductDetailsScreenBody> createState() =>
      _ProductDetailsScreenBodyState();
}

class _ProductDetailsScreenBodyState extends State<ProductDetailsScreenBody> {
  int quantity = 1;

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
        final bool hasDiscount = product.priceBefore != null &&
            product.priceBefore! > product.price;

        String imageUrl = '';
        if (product.images.isNotEmpty) {
          imageUrl = product.images.first.image;
        }

        return SafeArea(
          child: Column(
            children: <Widget>[
              // Custom App Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_rounded, size: 20.sp),
                      onPressed: () => context.pop(),
                    ),
                    Expanded(
                      child: AppText(
                        'Product Details',
                        alignment: AlignmentDirectional.center,
                        style: font18w700.copyWith(color: const Color(0xFF223A66)),
                      ),
                    ),
                    SizedBox(width: 40.w), // Balance for back button
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Image Container
                      Container(
                        width: double.infinity,
                        height: 300.h,
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: imageUrl.isNotEmpty
                            ? AppImage(
                                imageUrl: imageUrl,
                                fit: BoxFit.contain,
                              )
                            : const SizedBox(),
                      ),
                      SizedBox(height: 24.h),

                      // Title
                      AppText(
                        product.title,
                        style: font22w700.copyWith(color: const Color(0xFF153A63)),
                      ),
                      SizedBox(height: 16.h),

                      // Pricing
                      Row(
                        children: <Widget>[
                          AppText(
                            'EGP ${product.price.toStringAsFixed(0)}',
                            style: font24w700.copyWith(color: const Color(0xFF1E73D9)),
                          ),
                          if (hasDiscount) ...<Widget>[
                            SizedBox(width: 12.w),
                            AppText(
                              'EGP ${product.priceBefore!.toStringAsFixed(0)}',
                              style: font16w500.copyWith(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ],
                      ),
                      SizedBox(height: 24.h),

                      // Description
                      AppText(
                        'Description',
                        style: font16w700.copyWith(color: const Color(0xFF153A63)),
                      ),
                      SizedBox(height: 8.h),
                      AppText(
                        product.description,
                        style: font14w400.copyWith(
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),

              // Bottom Bar with Add to Cart and Quantity
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10.r,
                      offset: Offset(0, -5.h),
                    ),
                  ],
                ),
                child: OfferProductCardActions(
                  quantity: quantity,
                  isLarge: true,
                  onIncrement: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  onDecrement: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                  onAddToCart: () {
                    // TODO: Implement add to cart action for Product Details
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
