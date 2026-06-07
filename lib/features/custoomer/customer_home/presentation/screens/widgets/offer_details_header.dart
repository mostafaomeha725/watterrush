import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/app_date_time.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class OfferDetailsHeader extends StatelessWidget {
  const OfferDetailsHeader({
    super.key,
    required this.offer,
    required this.cartCount,
    required this.onBackTap,
    required this.onCartTap,
  });

  final OfferSliderItemData offer;
  final int cartCount;
  final VoidCallback onBackTap;
  final VoidCallback onCartTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(24.r),
          bottomLeft: Radius.circular(24.r),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: offer.colors,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 18.h,
            right: 10.w,
            child: Container(
              width: 92.w,
              height: 92.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x1AFFFFFF),
              ),
            ),
          ),
          Positioned(
            top: 42.h,
            right: 62.w,
            child: Container(
              width: 44.w,
              height: 44.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x1FFFFFFF),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: onBackTap,
                    child: Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 16.sp,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: onCartTap,
                    child: Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          Center(
                            child: AppAsset(
                              assetName: Assets.shoppingBag,
                              width: 18.w,
                              height: 18.w,
                              color: Colors.white,
                            ),
                          ),
                          if (cartCount > 0)
                            Positioned(
                              right: -3.w,
                              top: -4.h,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 1.h,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFF5B5B),
                                  shape: BoxShape.circle,
                                ),
                                child: AppText(
                                  '$cartCount',
                                  style: font10w700.copyWith(
                                    color: Colors.white,
                                  ),
                                  alignment: AlignmentDirectional.center,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpacing(14),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.16),
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Row(
                      children: <Widget>[
                        AppAsset(
                          assetName: Assets.giftAlt,
                          width: 14.w,
                          height: 14.w,
                          color: Colors.white,
                        ),
                        horizontalSpacing(4),
                        AppText(
                          offer.flashDealLabel,
                          style: font10w700.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpacing(8),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEF4444),
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: AppText(
                      offer.discountLabel,
                      style: font10w700.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              verticalSpacing(10),
              AppText(
                offer.title,
                style: font20w800.copyWith(color: Colors.white),
                maxLines: 2,
              ),
              verticalSpacing(4),
              AppText(
                offer.subtitle,
                style: font12w500.copyWith(
                  color: Colors.white.withValues(alpha: 0.96),
                ),
                maxLines: 2,
              ),
              verticalSpacing(12),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.schedule_rounded,
                    color: const Color(0xFFD5EBFF),
                    size: 16.sp,
                  ),
                  horizontalSpacing(6),
                  AppText(
                    'Valid until ${AppDateTime.formatDateTime(offer.validUntil, pattern: 'MMMM dd, yyyy')}',
                    style: font10w500.copyWith(color: const Color(0xFFD5EBFF)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
