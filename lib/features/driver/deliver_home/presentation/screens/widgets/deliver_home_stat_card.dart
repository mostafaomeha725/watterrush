import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class DeliverHomeStatCard extends StatelessWidget {
  const DeliverHomeStatCard({
    super.key,
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 6.w),
      decoration: BoxDecoration(
        color: const Color(0x18FFFFFF),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0x28FFFFFF), width: 1),
      ),
      child: Column(
        children: <Widget>[
          AppText(
            value,
            alignment: AlignmentDirectional.center,
            style: font20w700.copyWith(
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
          verticalSpacing(2),
          AppText(
            label,
            alignment: AlignmentDirectional.center,
            style: font10w500.copyWith(color: const Color(0xFFADCAFF)),
          ),
        ],
      ),
    );
  }
}