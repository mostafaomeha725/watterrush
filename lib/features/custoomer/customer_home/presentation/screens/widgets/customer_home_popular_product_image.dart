import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_image.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/entities/product_entity.dart';

class CustomerHomePopularProductImage extends StatelessWidget {
  const CustomerHomePopularProductImage({
    super.key,
    required this.product,
    required this.imageUrl,
    required this.hasDiscount,
    required this.discountPercentage,
  });

  final ProductEntity product;
  final String imageUrl;
  final bool hasDiscount;
  final int discountPercentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11.r),
              child: imageUrl.isNotEmpty
                  ? product.available
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
          ),
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
    );
  }
}
