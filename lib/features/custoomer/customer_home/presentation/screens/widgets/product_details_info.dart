import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class ProductDetailsInfo extends StatelessWidget {
  const ProductDetailsInfo({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.priceBefore,
    required this.hasDiscount,
  });

  final String title;
  final String description;
  final double price;
  final double? priceBefore;
  final bool hasDiscount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(
          title,
          style: font22w700.copyWith(color: const Color(0xFF153A63)),
        ),
        SizedBox(height: 16.h),
        Row(
          children: <Widget>[
            AppText(
              'EGP ${price.toStringAsFixed(0)}',
              style: font24w700.copyWith(color: const Color(0xFF1E73D9)),
            ),
            if (hasDiscount && priceBefore != null) ...<Widget>[
              SizedBox(width: 12.w),
              AppText(
                'EGP ${priceBefore!.toStringAsFixed(0)}',
                style: font16w500.copyWith(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ],
        ),
        SizedBox(height: 24.h),
        AppText(
          'Description',
          style: font16w700.copyWith(color: const Color(0xFF153A63)),
        ),
        SizedBox(height: 8.h),
        AppText(
          description,
          style: font14w400.copyWith(
            color: Colors.black54,
            height: 1.5,
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
