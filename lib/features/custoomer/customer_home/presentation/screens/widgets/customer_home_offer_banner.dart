import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'customer_home_offer_banner_content.dart';
import 'customer_home_offer_banner_media.dart';
import 'customer_home_view_models.dart';

class CustomerHomeOfferBanner extends StatelessWidget {
  const CustomerHomeOfferBanner({
    required this.data,
    required this.onOrderNow,
    super.key,
  });

  final HomeBannerViewModel data;
  final VoidCallback onOrderNow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20.h),
            padding: EdgeInsets.fromLTRB(18.w, 16.h, 10.w, 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: const LinearGradient(
                colors: [Color(0xFF0344B8), Color(0xFF1B7CF0), Color(0xFF86CEFF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF80B9FF).withOpacity(0.24),
                  blurRadius: 30.r,
                  offset: Offset(0, 12.h),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomerHomeOfferBannerContent(
                    data: data,
                    onOrderNow: onOrderNow,
                  ),
                ),
                SizedBox(width: 160.w),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: CustomerHomeOfferBannerMedia(data: data),
          ),
        ],
      ),
    );
  }
}
