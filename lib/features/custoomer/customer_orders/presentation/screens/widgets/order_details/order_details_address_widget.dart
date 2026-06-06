import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class OrderDetailsAddressWidget extends StatelessWidget {
  const OrderDetailsAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: const Color(0xFF0B48C6).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(
              Icons.location_on_rounded,
              color: const Color(0xFF0B48C6),
              size: 24.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Delivery Address',
                  style: font10w500.copyWith(color: const Color(0xFF1B2028)),
                ),
                SizedBox(height: 2.h),
                AppText(
                  'mostafa',
                  style: font14w700.copyWith(color: const Color(0xFF0F2B46)),
                ),
                SizedBox(height: 2.h),
                AppText(
                  'Monshaat Sultan, Menofia Governorate',
                  style: font12w400.copyWith(color: const Color(0xFF6F8097)),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: const Color(0xFF8B92A2),
            size: 24.sp,
          ),
        ],
      ),
    );
  }
}
