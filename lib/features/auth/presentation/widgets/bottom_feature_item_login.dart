import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class BottomFeatureItemLogin extends StatelessWidget {
  const BottomFeatureItemLogin({
    super.key,
    required this.emoji,
    required this.title,
    required this.subtitle,
  });

  final String emoji;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFFD8F4FA),
              shape: BoxShape.circle,
            ),
            child: AppText(
              emoji,
              style: font18w500,
              alignment: AlignmentDirectional.center,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  style: font18w500.copyWith(color: const Color(0xFF263453)),
                ),
                SizedBox(height: 2.h),
                AppText(
                  subtitle,
                  style: font14w400.copyWith(color: const Color(0xFF556884)),
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}