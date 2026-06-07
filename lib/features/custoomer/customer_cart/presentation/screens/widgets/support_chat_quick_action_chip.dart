import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/custom_button.dart';

class SupportChatQuickActionChip extends StatelessWidget {
  const SupportChatQuickActionChip({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.h,
      child: AppButton(
        text: label,
        onPressed: onTap,
        color: const Color(0xFFF5F7F9),
        textColor: const Color(0xFF0F2742),
        borderColor: const Color(0xFFE0E5EB),
        radius: 20.r,
        textSize: 12.sp,
        textWeight: FontWeight.w500,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      ),
    );
  }
}
