import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class OrderItemRow extends StatelessWidget {
  const OrderItemRow({
    super.key,
    required this.emoji,
    required this.title,
    required this.quantity,
    required this.price,
  });

  final String emoji;
  final String title;
  final String quantity;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: const Color(0xFFD0EEF7),
            borderRadius: BorderRadius.circular(12.r),
          ),
          alignment: Alignment.center,
          child: AppText(
            emoji,
            style: font22w500,
            alignment: AlignmentDirectional.center,
          ),
        ),
        horizontalSpacing(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title,
                style: font18w500.copyWith(color: const Color(0xFF0E233B)),
              ),
              AppText(
                quantity,
                style: font14w400.copyWith(color: const Color(0xFF6A7E90)),
              ),
            ],
          ),
        ),
        AppText(
          price,
          style: font18w500.copyWith(color: const Color(0xFF078DB7)),
        ),
      ],
    );
  }
}
