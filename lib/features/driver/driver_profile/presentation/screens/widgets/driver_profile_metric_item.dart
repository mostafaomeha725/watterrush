import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class DriverProfileMetricItem extends StatelessWidget {
  const DriverProfileMetricItem({
    super.key,
    required this.value,
    required this.title,
    required this.valueColor,
  });

  final String value;
  final String title;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          AppText(
            value,
            alignment: AlignmentDirectional.center,
            style: font24w700.copyWith(
              color: valueColor,
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 4.h),
          AppText(
            title,
            alignment: AlignmentDirectional.center,
            style: font12w500.copyWith(color: const Color(0xFF8FA1B9)),
          ),
        ],
      ),
    );
  }
}
