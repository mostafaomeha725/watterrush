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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText(
                'Hello,',
                style: font14w400.copyWith(color: const Color(0xFFE5F0FF)),
              ),
              verticalSpacing(2),
              AppText(
                'Kareem 👋',
                style: font26w700.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999.r),
            gradient: const LinearGradient(
              colors: <Color>[Color(0xFF2BC8A5), Color(0xFF1DA4CB)],
            ),
            border: Border.all(color: const Color(0x3DFFFFFF)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.wifi_tethering_rounded,
                color: const Color(0xFF8EF4D5),
                size: 16.sp,
              ),
              horizontalSpacing(6),
              AppText(
                'Online',
                style: font14w700.copyWith(color: const Color(0xFF18DDA7)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
