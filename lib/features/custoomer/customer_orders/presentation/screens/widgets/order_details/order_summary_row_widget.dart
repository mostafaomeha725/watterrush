import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class OrderSummaryRowWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool isIconCheck;
  final Color? valueColor;

  const OrderSummaryRowWidget({
    super.key,
    required this.title,
    required this.value,
    this.isIconCheck = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(2.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isIconCheck
                    ? const Color(0xFF10B981).withOpacity(0.1)
                    : const Color(0xFF8B92A2).withOpacity(0.1),
              ),
              child: Icon(
                isIconCheck ? Icons.check_rounded : Icons.circle,
                color: isIconCheck
                    ? const Color(0xFF10B981)
                    : const Color(0xFFD9E0E8),
                size: isIconCheck ? 10.sp : 8.sp,
              ),
            ),
            SizedBox(width: 8.w),
            AppText(
              title,
              style: font12w400.copyWith(color: const Color(0xFF6F8097)),
            ),
          ],
        ),
        AppText(
          value,
          style: font12w700.copyWith(
            color: valueColor ?? const Color(0xFF1B2028),
          ),
        ),
      ],
    );
  }
}
