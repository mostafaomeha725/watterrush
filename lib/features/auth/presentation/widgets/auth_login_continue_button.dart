import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/custom_button.dart';

class AuthLoginContinueButton extends StatelessWidget {
  const AuthLoginContinueButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton.icon(
      text: 'Continue',
      onPressed: onPressed,
      child: Icon(
        Icons.arrow_forward_rounded,
        color: Colors.white,
        size: 22.sp,
      ),
      gradient: const LinearGradient(
        colors: [Color(0xFF113FC2), Color(0xFF2499FF)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      textSize: 17.sp,
      textWeight: FontWeight.w700,
      radius: 16.r,
      height: 54.h,
      borderColor: Colors.transparent,
    );
  }
}
