import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class AuthTypeTrustItem extends StatelessWidget {
  const AuthTypeTrustItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    super.key,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFF8FBFF),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6D9DD6).withValues(alpha: 0.18),
                  blurRadius: 8.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: Icon(icon, color: const Color(0xFF2A84F2), size: 18.sp),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  maxLines: 1,
                  style: font10w700.copyWith(
                    color: const Color(0xFF183A74),
                    letterSpacing: -0.1,
                  ),
                ),
                SizedBox(height: 2.h),
                AppText(
                  subtitle,
                  maxLines: 1,
                  style: font8w500.copyWith(color: const Color(0xFF6F83A3)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
