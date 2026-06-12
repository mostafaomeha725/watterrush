import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import '../../../domain/entities/slider_entity.dart';
import 'customer_home_view_models.dart';

class CustomerHomeOfferBannerContent extends StatelessWidget {
  const CustomerHomeOfferBannerContent({
    required this.slider,
    required this.onOrderNow,
    super.key,
  });

  final SliderEntity slider;
  final VoidCallback onOrderNow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFF2D8EF3).withOpacity(0.4),
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.local_fire_department_rounded,
                  size: 14.sp,
                  color: const Color(0xFFFFA12C),
                ),
                SizedBox(width: 6.w),
                AppText(
                  slider.tag,
                  style: font10w700.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          AppText(
            slider.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: font22w700.copyWith(color: Colors.white),
          ),
          SizedBox(height: 4.h),
          AppText(
            slider.description,
            maxLines: 2,
            style: font12w500.copyWith(color: Colors.white),
          ),
          SizedBox(height: 14.h),
          SizedBox(
            width: 148.w,
            child: AppButton.icon(
              text: slider.buttonText,
              onPressed: onOrderNow,
              height: 42.h,
              radius: 22.r,
              color: const Color(0xFF133CC1),
              borderColor: const Color(0xFF3F70EA),
              textColor: Colors.white,
              contentPadding: EdgeInsets.only(right: 16.w),
              textSize: 12.sp,
              textWeight: FontWeight.w800,
              child: Padding(
                padding: EdgeInsets.only(left: 1.w),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
