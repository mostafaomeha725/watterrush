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
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAFF),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFCDD9EE), width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 38.w,
            height: 52.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xFF1464D8), Color(0xFF0C2461)],
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 16.w,
                  height: 4.h,
                  color: const Color(0xFFEA5151),
                ),
                SizedBox(height: 3.h),
                Container(width: 16.w, height: 4.h, color: Colors.white),
                SizedBox(height: 3.h),
                Container(
                  width: 16.w,
                  height: 4.h,
                  color: const Color(0xFF3BCB83),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          AppText(
            plateNumber,
            style: font20w700.copyWith(
              color: const Color(0xFF0B2650),
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
