import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/entities/product_entity.dart';

class CustomerHomePopularProductInfo extends StatelessWidget {
  const CustomerHomePopularProductInfo({
    super.key,
    required this.product,
    required this.hasDiscount,
  });

  final ProductEntity product;
  final bool hasDiscount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Title
        AppText(
          product.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: font12w700.copyWith(color: const Color(0xFF153A63)),
        ),
        SizedBox(height: 8.h),

        // Price
        Row(
          children: <Widget>[
            AppText(
              'EGP ${product.price.toStringAsFixed(0)}',
              style: font14w700.copyWith(color: const Color(0xFF1E73D9)),
            ),
            if (hasDiscount) ...<Widget>[
              SizedBox(width: 4.w),
              AppText(
                'EGP ${product.priceBefore!.toStringAsFixed(0)}',
                style: font10w500.copyWith(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
