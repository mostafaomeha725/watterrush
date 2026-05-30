import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/widgets/app_form_field.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({
    super.key,
    required this.controller,
    required this.hint,
  });

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return AppFormField(
      controller: controller,
      hintText: hint,
      keyboardType: TextInputType.phone,
      radius: 18.r,
      fillColor: AppLightColors.white,
      borderColor: const Color(0xFFDCE4F1),
      focusedBorderColor: AppLightColors.buttonColor,
      borderWidth: 1.w,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Icon(
          Icons.phone_outlined,
          size: 21.sp,
          color: const Color(0xFF6D7F99),
        ),
      ),
    );
  }
}
