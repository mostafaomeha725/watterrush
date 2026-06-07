import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_logo_section.dart';

class OtpVerificationHeader extends StatelessWidget {
  const OtpVerificationHeader({required this.phoneNumber, super.key});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTypeLogoSection(height: 130.h),
        SizedBox(height: 14.h),
        AppText(
          'Enter OTP',
          alignment: AlignmentDirectional.center,
          style: font32w900.copyWith(color: const Color(0xFF103A78)),
        ),
        SizedBox(height: 10.h),
        AppText(
          'We\'ve sent a 6 digit verification code',
          alignment: AlignmentDirectional.center,
          style: font14w500.copyWith(color: const Color(0xFF7D8DAA)),
        ),
        SizedBox(height: 4.h),
        AppText(
          'to $phoneNumber',
          alignment: AlignmentDirectional.center,
          style: font16w700.copyWith(color: const Color(0xFF1F8EFF)),
        ),
      ],
    );
  }
}
