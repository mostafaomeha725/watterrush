import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class OfferProductCardDetails extends StatelessWidget {
  const OfferProductCardDetails({super.key, required this.product});

  final OfferProductItemData product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: AppText(
                product.name,
                style: font16w700.copyWith(color: const Color(0xFF102A43)),
                maxLines: 1,
              ),
            ),
            horizontalSpacing(6),
            Container(
              margin: EdgeInsets.only(top: 2.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star_rounded,
                    size: 15.sp,
                    color: const Color(0xFFF4A11A),
                  ),
                  horizontalSpacing(2),
                  AppText(
                    product.rating.toStringAsFixed(1),
                    style: font12w700.copyWith(color: const Color(0xFF33567B)),
                  ),
                  horizontalSpacing(2),
                  AppText(
                    '(${product.reviewsCount})',
                    style: font10w500.copyWith(
                      color: const Color(0xFF9AAEC3),
                      height: 1.35,
                    ),
                    textMargin: EdgeInsets.only(top: 1.h),
                  ),
                ],
              ),
            ),
          ],
        ),
        verticalSpacing(2),
        AppText(
          product.subtitle,
          style: font12w500.copyWith(color: const Color(0xFF7B8EA2)),
        ),
        verticalSpacing(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            AppText(
              'EGP ${product.currentPrice.toStringAsFixed(0)}',
              style: font24w700.copyWith(color: const Color(0xFF0D67D3)),
            ),
            horizontalSpacing(6),
            Padding(
              padding: EdgeInsets.only(bottom: 3.h),
              child: AppText(
                'EGP ${product.oldPrice.toStringAsFixed(0)}',
                style: font12w500.copyWith(
                  color: const Color(0xFF99AABE),
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ),
          ],
        ),
        verticalSpacing(2),
        AppText(
          'Save EGP ${product.saveAmount}',
          style: font12w700.copyWith(color: const Color(0xFF2AA964)),
        ),
      ],
    );
  }
}