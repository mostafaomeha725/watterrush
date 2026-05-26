import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:waterrush/features/auth/presentation/cubit/otp_cubit.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField({required this.cubit, super.key});

  final OtpCubit cubit;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      controller: cubit.otpController,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      enableActiveFill: true,
      cursorColor: const Color(0xFF3B8DFF),
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12.r),
        fieldHeight: 56.h,
        fieldWidth: 47.w,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedFillColor: Colors.white,
        activeColor: const Color(0xFF3B8DFF),
        inactiveColor: const Color(0xFFD7E3F5),
        selectedColor: const Color(0xFF3B8DFF),
        borderWidth: 1.w,
      ),
      onChanged: (value) {
        cubit.onOtpChanged(value);
      },
      onCompleted: (value) {
        // Optional: auto-verify here if wanted, or leave it to Verify OTP button
      },
    );
  }
}
