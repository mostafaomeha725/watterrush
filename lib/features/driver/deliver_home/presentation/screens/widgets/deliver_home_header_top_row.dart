import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class DeliverHomeHeaderTopRow extends StatelessWidget {
  const DeliverHomeHeaderTopRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 46.w,
          height: 46.w,
          decoration: BoxDecoration(
            color: const Color(0x22FFFFFF),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0x35FFFFFF), width: 1.5),
          ),
          child: Icon(
            Icons.person_rounded,
            color: const Color(0xFFD8E8FF),
            size: 24.sp,
          ),
        ),
        horizontalSpacing(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText(
                'Good morning,',
                style: font12w500.copyWith(color: const Color(0xFFADCAFF)),
              ),
              verticalSpacing(1),
              AppText(
                'Kareem 👋',
                style: font22w700.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999.r),
            color: const Color(0x1FFFFFFF),
            border: Border.all(color: const Color(0x40FFFFFF), width: 1),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 8.w,
                height: 8.w,
                decoration: const BoxDecoration(
                  color: Color(0xFF18DDA7),
                  shape: BoxShape.circle,
                ),
              ),
              horizontalSpacing(7),
              AppText(
                'Online',
                style: font12w700.copyWith(color: const Color(0xFF18DDA7)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
