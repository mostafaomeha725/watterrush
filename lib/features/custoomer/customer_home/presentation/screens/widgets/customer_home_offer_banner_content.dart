import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'customer_home_view_models.dart';

class CustomerHomeOfferBannerContent extends StatelessWidget {
  const CustomerHomeOfferBannerContent({
    required this.data,
    required this.onOrderNow,
    super.key,
  });

  final HomeBannerViewModel data;
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
                  'LIMITED TIME',
                  style: font10w700.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          AppText(
            data.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: font22w700.copyWith(color: Colors.white),
          ),
          SizedBox(height: 4.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Get up to ',
                  style: font12w500.copyWith(color: Colors.white),
                ),
                TextSpan(
                  text: '35%',
                  style: font12w500.copyWith(color: const Color(0xff08f1ff)),
                ),
                TextSpan(
                  text: ' off on\nselected products',
                  style: font12w500.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          SizedBox(
            width: 148.w,
            child: AppButton.icon(
              text: 'Order Now',
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
