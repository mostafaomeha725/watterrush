import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CheckoutHeader extends StatelessWidget {
  const CheckoutHeader({super.key, required this.onBackTap});

  final VoidCallback onBackTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBackTap,
          child: Container(
            width: 38.w,
            height: 38.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11.r),
              border: Border.all(color: const Color(0xFFD9E0E8)),
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16.sp,
              color: const Color(0xFF0F2B46),
            ),
          ),
        ),
        horizontalSpacing(10),
        AppText(
          'Checkout',
          style: font20w700.copyWith(color: const Color(0xFF0F2B46)),
        ),
      ],
    );
  }
}
