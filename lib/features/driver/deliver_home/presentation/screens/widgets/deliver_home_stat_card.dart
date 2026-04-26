import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
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
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0x26FFFFFF),
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        children: <Widget>[
          AppText(
            value,
            alignment: AlignmentDirectional.center,
            style: font24w700.copyWith(color: Colors.white),
          ),
          AppText(
            label,
            alignment: AlignmentDirectional.center,
            style: font10w500.copyWith(color: const Color(0xFFE2EDFF)),
          ),
        ],
      ),
    );
  }
}
