import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class SpecialOfferCardTopRow extends StatelessWidget {
  const SpecialOfferCardTopRow({
    super.key,
    required this.offer,
    required this.accentColor,
    required this.categoryTag,
  });

  final OfferSliderItemData offer;
  final Color accentColor;
  final String categoryTag;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: accentColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: accentColor.withValues(alpha: 0.25)),
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.bolt_rounded, size: 11.sp, color: accentColor),
              horizontalSpacing(3),
              AppText(
                offer.flashDealLabel,
                style: font10w700.copyWith(color: accentColor),
              ),
            ],
          ),
        ),
        horizontalSpacing(8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: const Color(0xFFFF4444),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: AppText(
            '-${offer.discountLabel.replaceAll(' OFF', '')}',
            style: font10w700.copyWith(color: Colors.white),
          ),
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F6FB),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: const Color(0xFFE0E8F5)),
          ),
          child: AppText(
            categoryTag,
            style: font10w500.copyWith(color: const Color(0xFF4A6FA5)),
          ),
        ),
      ],
    );
  }
}
