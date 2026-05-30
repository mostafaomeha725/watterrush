import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/app_image.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class SpecialOfferCardBodyRow extends StatelessWidget {
  const SpecialOfferCardBodyRow({
    super.key,
    required this.offer,
    required this.accentColor,
  });

  final OfferSliderItemData offer;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final String imageUrl = offer.products.isNotEmpty
        ? offer.products.first.imageUrl
        : '';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText(
                offer.title,
                style: font18w700.copyWith(
                  color: const Color(0xFF0F2D52),
                  height: 1.2,
                ),
                maxLines: 2,
              ),
              verticalSpacing(6),
              AppText(
                offer.subtitle,
                style: font12w500.copyWith(color: const Color(0xFF6A85A8)),
                maxLines: 2,
              ),
            ],
          ),
        ),
        horizontalSpacing(12),
        Container(
          width: 74.w,
          height: 74.w,
          decoration: BoxDecoration(
            color: accentColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: accentColor.withValues(alpha: 0.15),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13.r),
            child: imageUrl.isNotEmpty
                ? AppImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    width: 74.w,
                    height: 74.w,
                    showprogressIndicator: false,
                  )
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}