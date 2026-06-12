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
            if (product.oldPrice > product.currentPrice) ...[
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
          ],
        ),
        if (product.saveAmount > 0) ...[
          verticalSpacing(2),
          AppText(
            'Save EGP ${product.saveAmount}',
            style: font12w700.copyWith(color: const Color(0xFF2AA964)),
          ),
        ],
      ],
    );
  }
}
