import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_image.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/entities/product_entity.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_product_card_actions.dart';

class CustomerHomePopularProductCard extends StatefulWidget {
  const CustomerHomePopularProductCard({
    required this.product,
    required this.onAddToCart,
    super.key,
  });

  final ProductEntity product;
  final void Function(int quantity) onAddToCart;

  @override
  State<CustomerHomePopularProductCard> createState() =>
      _CustomerHomePopularProductCardState();
}

class _CustomerHomePopularProductCardState
    extends State<CustomerHomePopularProductCard> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final bool hasDiscount =
        widget.product.priceBefore != null &&
        widget.product.priceBefore! > widget.product.price;
    final int discountPercentage = hasDiscount
        ? (((widget.product.priceBefore! - widget.product.price) /
                      widget.product.priceBefore!) *
                  100)
              .round()
        : 0;

    String imageUrl = '';
    if (widget.product.images.isNotEmpty) {
      imageUrl = widget.product.images.first.image;
    }

    return GestureDetector(
      onTap: () =>
          context.push(Routes.productDetailsScreen, extra: widget.product.id),
      child: Container(
        width: 175.w, // Slightly increased width to fit actions
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
            // Image and Badge
            Expanded(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: imageUrl.isNotEmpty
                        ? widget.product.available
                            ? AppImage(imageUrl: imageUrl, fit: BoxFit.contain)
                            : ColorFiltered(
                                colorFilter: const ColorFilter.matrix(<double>[
                                  0.2126, 0.7152, 0.0722, 0, 0,
                                  0.2126, 0.7152, 0.0722, 0, 0,
                                  0.2126, 0.7152, 0.0722, 0, 0,
                                  0,      0,      0,      1, 0,
                                ]),
                                child: Opacity(
                                  opacity: 0.6,
                                  child: AppImage(imageUrl: imageUrl, fit: BoxFit.contain),
                                ),
                              )
                        : const SizedBox(), // Fallback if no image
                  ),
                  if (hasDiscount)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF44336), // Red badge
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: AppText(
                          '-$discountPercentage%',
                          style: font10w700.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 12.h),

            // Title
            AppText(
              widget.product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: font12w700.copyWith(color: const Color(0xFF153A63)),
            ),
            SizedBox(height: 8.h),

            // Price
            Row(
              children: <Widget>[
                AppText(
                  'EGP ${widget.product.price.toStringAsFixed(0)}',
                  style: font14w700.copyWith(color: const Color(0xFF1E73D9)),
                ),
                if (hasDiscount) ...<Widget>[
                  SizedBox(width: 4.w),
                  AppText(
                    'EGP ${widget.product.priceBefore!.toStringAsFixed(0)}',
                    style: font10w500.copyWith(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ],
            ),
            SizedBox(height: 12.h),

            // Add to Cart Button with Quantity
            if (widget.product.available)
              OfferProductCardActions(
                quantity: quantity,
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
                onAddToCart: () => widget.onAddToCart(quantity),
                addButtonText: 'Add', // Shorter text to fit nicely
              )
            else
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF5F5),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: const Color(0xFFFFD6D6)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.hourglass_empty_rounded,
                      size: 14.sp,
                      color: const Color(0xFFE53935),
                    ),
                    SizedBox(width: 4.w),
                    AppText(
                      'Sold Out',
                      style: font12w700.copyWith(color: const Color(0xFFE53935)),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
