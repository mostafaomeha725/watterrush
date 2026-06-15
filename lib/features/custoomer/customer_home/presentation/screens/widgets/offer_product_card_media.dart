import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/app_image.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class OfferProductCardMedia extends StatelessWidget {
  const OfferProductCardMedia({
    super.key,
    required this.product,
    this.mediaHeight,
    this.showPopularTag = true,
    this.discountBadgeText,
  });

  final OfferProductItemData product;
  final double? mediaHeight;
  final bool showPopularTag;
  final String? discountBadgeText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaHeight ?? 145.h,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11.r),
                child: AppImage(
                  imageUrl: product.imageUrl,
                  fit: BoxFit.contain,
                  showprogressIndicator: true,
                ),
              ),
            ),
          ),
          if ((discountBadgeText ?? product.discountLabel).isNotEmpty)
            Positioned(
              top: 10.h,
              left: 10.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFEF4444),
                  borderRadius: BorderRadius.circular(999.r),
                ),
                child: AppText(
                  discountBadgeText ?? product.discountLabel,
                  style: font10w700.copyWith(color: Colors.white),
                ),
              ),
            ),
          if (product.isPopular && showPopularTag)
            Positioned(
              top: 10.h,
              right: 10.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFFBE2B6)),
                  borderRadius: BorderRadius.circular(32.r),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: const Color(0xFF9AAEC3).withValues(alpha: 0.16),
                      blurRadius: 8.r,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.local_fire_department_rounded,
                      size: 12.sp,
                      color: const Color(0xFFF08A00),
                    ),
                    horizontalSpacing(4),
                    AppText(
                      'Popular',
                      style: font10w700.copyWith(
                        color: const Color(0xFFF08A00),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
