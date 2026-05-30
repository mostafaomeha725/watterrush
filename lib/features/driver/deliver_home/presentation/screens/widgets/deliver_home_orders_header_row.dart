import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class DeliverHomeOrdersHeaderRow extends StatelessWidget {
  const DeliverHomeOrdersHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 4.w,
          height: 22.h,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xFF1A6EE8), Color(0xFF0C52BC)],
            ),
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        horizontalSpacing(8),
        Expanded(
          child: AppText(
            'New Orders',
            style: font18w700.copyWith(color: const Color(0xFF0B2650)),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: const Color(0xFFFFEAEA),
            borderRadius: BorderRadius.circular(999.r),
            border: Border.all(color: const Color(0xFFFFCBCB), width: 1),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 7.w,
                height: 7.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFEA3434),
                  shape: BoxShape.circle,
                ),
              ),
              horizontalSpacing(6),
              AppText(
                '3 Pending',
                style: font12w700.copyWith(color: const Color(0xFFCC2C2C)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}