import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class AuthTypeHeadingSection extends StatelessWidget {
  const AuthTypeHeadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          'How would you like to continue?',
          alignment: AlignmentDirectional.center,
          style: font20w700.copyWith(color: const Color(0xFF173B79)),
        ),
        SizedBox(height: 8.h),
        AppText(
          'Select your role to get started',
          alignment: AlignmentDirectional.center,
          style: font14w500.copyWith(color: const Color(0xFF7B8FAF)),
        ),
      ],
    );
  }
}