import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_product_card_actions.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_product_card_details.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/offer_product_card_media.dart';

class OfferProductCard extends StatelessWidget {
  const OfferProductCard({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onAddToCart,
    this.compactLayout = false,
    this.isAdded = false,
    this.addButtonText = 'Add to Cart',
    this.addedButtonText = 'Added',
    this.badgeTextOverride,
  });

  final OfferProductItemData product;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onAddToCart;
  final bool compactLayout;
  final bool isAdded;
  final String addButtonText;
  final String addedButtonText;
  final String? badgeTextOverride;

  @override
  Widget build(BuildContext context) {
    final BorderRadius cardRadius = BorderRadius.circular(16.r);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: cardRadius,
        border: Border.all(color: const Color(0xFFCCD8E5), width: 1.25),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF8FA8BF).withValues(alpha: 0.12),
            blurRadius: 12.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: compactLayout
          ? IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    width: 104.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        bottomLeft: Radius.circular(16.r),
                      ),
                      child: OfferProductCardMedia(
                        product: product,
                        mediaHeight: 132.h,
                        showPopularTag: false,
                        discountBadgeText: badgeTextOverride,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.w, 9.h, 10.w, 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          OfferProductCardDetails(product: product),
                          verticalSpacing(8),
                          OfferProductCardActions(
                            quantity: quantity,
                            onIncrement: onIncrement,
                            onDecrement: onDecrement,
                            onAddToCart: onAddToCart,
                            isAdded: isAdded,
                            addButtonText: addButtonText,
                            addedButtonText: addedButtonText,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: <Widget>[
                OfferProductCardMedia(
                  product: product,
                  discountBadgeText: badgeTextOverride,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 14.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      OfferProductCardDetails(product: product),
                      verticalSpacing(10),
                      OfferProductCardActions(
                        quantity: quantity,
                        onIncrement: onIncrement,
                        onDecrement: onDecrement,
                        onAddToCart: onAddToCart,
                        isAdded: isAdded,
                        addButtonText: addButtonText,
                        addedButtonText: addedButtonText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
