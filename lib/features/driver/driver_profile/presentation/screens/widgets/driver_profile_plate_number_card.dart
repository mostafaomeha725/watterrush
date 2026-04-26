import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class DriverProfilePlateNumberCard extends StatelessWidget {
  const DriverProfilePlateNumberCard({super.key, required this.plateNumber});

  final String plateNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAFF),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFC6D5EE)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 40.w,
            height: 54.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: const Color(0xFF0F67CC),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 16.w,
                  height: 5.h,
                  color: const Color(0xFFEA5151),
                ),
                SizedBox(height: 3.h),
                Container(width: 16.w, height: 5.h, color: Colors.white),
                SizedBox(height: 3.h),
                Container(
                  width: 16.w,
                  height: 5.h,
                  color: const Color(0xFF3BCB83),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          AppText(
            plateNumber,
            style: font22w700.copyWith(color: const Color(0xFF102B54)),
            textPadding: EdgeInsets.only(left: 8.w),
          ),
        ],
      ),
    );
  }
}
