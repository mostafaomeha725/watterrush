import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/widgets/app_form_field.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({
    super.key,
    required this.controller,
    required this.hint,
    this.countryFlag = '🇪🇬',
    this.countryCode = '+20',
    this.onCountryTap,
  });

  final TextEditingController controller;
  final String hint;
  final String countryFlag;
  final String countryCode;
  final VoidCallback? onCountryTap;

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
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      prefixIcon: SizedBox(
        width: 128.w,
        child: GestureDetector(
          onTap: onCountryTap,
          behavior: HitTestBehavior.opaque,
          child: Row(
            children: [
              SizedBox(width: 10.w),
              Icon(
                Icons.phone_outlined,
                size: 21.sp,
                color: const Color(0xFF6D7F99),
              ),
              SizedBox(width: 8.w),
              AppText(countryFlag, alignment: AlignmentDirectional.center),
              SizedBox(width: 5.w),
              AppText(
                countryCode,
                style: TextStyle(
                  color: const Color(0xFF344D71),
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(width: 3.w),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20.sp,
                color: const Color(0xFF6D7F99),
              ),
              SizedBox(width: 6.w),
              Container(
                width: 1.w,
                height: 24.h,
                color: const Color(0xFFD8E1EE),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
