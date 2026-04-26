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
        Expanded(
          child: AppText(
            'New Orders',
            style: font18w700.copyWith(color: const Color(0xFF09244D)),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
          decoration: BoxDecoration(
            color: const Color(0xFFFFE8E8),
            borderRadius: BorderRadius.circular(999.r),
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.circle, size: 7.sp, color: const Color(0xFFF14646)),
              horizontalSpacing(5),
              AppText(
                '3 Pending',
                style: font12w700.copyWith(color: const Color(0xFFCF3A3A)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
