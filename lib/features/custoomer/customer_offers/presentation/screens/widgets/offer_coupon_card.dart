import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/bouncing_social_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_offers/presentation/screens/widgets/offers_models.dart';

class OfferCouponCard extends StatelessWidget {
  const OfferCouponCard({super.key, required this.item, required this.onCopy});

  final OfferItemModel item;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFDDE3EC)),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 6.h,
            decoration: BoxDecoration(color: item.accentColor),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 54.w,
                      height: 54.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            item.accentColor,
                            item.accentColor.withValues(alpha: 0.72),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Icon(item.icon, color: Colors.white, size: 24.sp),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            item.title,
                            style: font24w700.copyWith(
                              fontSize: 20.sp,
                              color: const Color(0xFF0F2B46),
                            ),
                          ),
                          SizedBox(height: 3.h),
                          AppText(
                            item.subtitle,
                            style: font16w400.copyWith(
                              color: const Color(0xFF223B56),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          AppText(
                            item.validText,
                            style: font12w400.copyWith(
                              color: const Color(0xFF6B7B8D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: const Color(0xFFCBD4DE)),
                        ),
                        child: AppText(
                          item.code,
                          style: font16w700.copyWith(
                            color: const Color(0xFF0B1F36),
                          ),
                          alignment: AlignmentDirectional.center,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: BouncingSocialButton(
                        text: 'Copy',
                        onTap: onCopy,
                        color: AppLightColors.buttonColor1,
                        textColor: Colors.white,
                        textSize: 14.sp,

                        leading: Icon(
                          Icons.content_copy_rounded,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}