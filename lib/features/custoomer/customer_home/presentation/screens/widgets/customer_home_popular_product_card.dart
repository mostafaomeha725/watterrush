import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/widgets/custom_nav_bar.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/entities/product_entity.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_popular_product_image.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_popular_product_info.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_popular_product_cart_actions.dart';

class CustomerHomePopularProductCard extends StatelessWidget {
  const CustomerHomePopularProductCard({
    required this.product,
    required this.onAddToCart,
    super.key,
  });

  final ProductEntity product;
  final void Function(int quantity) onAddToCart;

  @override
  Widget build(BuildContext context) {
    final bool hasDiscount =
        product.priceBefore != null && product.priceBefore! > product.price;
    final int discountPercentage = hasDiscount
        ? (((product.priceBefore! - product.price) / product.priceBefore!) * 100).round()
        : 0;

    String imageUrl = '';
    if (product.images.isNotEmpty) {
      imageUrl = product.images.first.image;
    }

    return GestureDetector(
      onTap: () async {
        final result = await context.push(
          Routes.productDetailsScreen,
          extra: product.id,
        );
        if (result == 'go_to_cart_tab' && context.mounted) {
          CustomNavBar.switchToTab(context, 2);
        }
      },
      child: Container(
        width: 175.w,
        margin: EdgeInsets.only(right: 12.w),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: CustomerHomePopularProductImage(
                product: product,
                imageUrl: imageUrl,
                hasDiscount: hasDiscount,
                discountPercentage: discountPercentage,
              ),
            ),
            SizedBox(height: 12.h),
            CustomerHomePopularProductInfo(
              product: product,
              hasDiscount: hasDiscount,
            ),
            SizedBox(height: 12.h),
            CustomerHomePopularProductCartActions(
              product: product,
              onAddToCart: onAddToCart,
            ),
          ],
        ),
      ),
    );
  }
}

