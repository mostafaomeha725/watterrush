import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/app_date_time.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class SpecialOfferCardFooter extends StatelessWidget {
  const SpecialOfferCardFooter({super.key, required this.offer});

  final OfferSliderItemData offer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.access_time_rounded,
          size: 13.sp,
          color: const Color(0xFFB0BFD8),
        ),
        horizontalSpacing(5),
        Expanded(
          child: AppText(
            'Valid until ${AppDateTime.formatDateTime(offer.validUntil, pattern: 'MMM dd, yyyy')}',
            style: font12w500.copyWith(color: const Color(0xFFB0BFD8)),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: const Color(0xFF0F2D52),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: <Widget>[
              AppText(
                'View Deal',
                style: font12w700.copyWith(color: Colors.white),
              ),
              horizontalSpacing(5),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 10.sp,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}