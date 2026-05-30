import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthCompactTrustDivider extends StatelessWidget {
  const AuthCompactTrustDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      width: 1.w,
      height: 24.h,
      color: const Color(0xFFDCE6F4),
    );
  }
}