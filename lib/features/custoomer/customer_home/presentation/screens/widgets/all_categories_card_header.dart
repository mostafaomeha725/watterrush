import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class AllCategoriesCardHeader extends StatelessWidget {
  const AllCategoriesCardHeader({
    super.key,
    required this.title,
    required this.productsCount,
    required this.onOfferCount,
    required this.headerColors,
  });

  final String title;
  final int productsCount;
  final int onOfferCount;
  final List<Color> headerColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(14.w, 10.h, 14.w, 10.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: headerColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4F52),
                  borderRadius: BorderRadius.circular(999.r),
                ),
                child: AppText(
                  '$onOfferCount on offer',
                  style: font10w700.copyWith(color: Colors.white),
                ),
              ),
              const Spacer(),
              Container(
                constraints: BoxConstraints(minWidth: 56.w),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
                decoration: BoxDecoration(
                  color: const Color(0x29FFFFFF),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: <Widget>[
                    AppText(
                      '$productsCount',
                      style: font24w700.copyWith(color: Colors.white),
                      alignment: AlignmentDirectional.center,
                    ),
                    AppText(
                      'products',
                      style: font10w700.copyWith(
                        color: const Color(0xFFE8F5FF),
                      ),
                      alignment: AlignmentDirectional.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpacing(6),
          AppText(
            title,
            style: font24w700.copyWith(color: Colors.white, height: 1),
          ),
        ],
      ),
    );
  }
}