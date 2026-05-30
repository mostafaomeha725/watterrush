import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_form_field.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CartPromoCodeCard extends StatelessWidget {
  const CartPromoCodeCard({
    super.key,
    required this.controller,
    required this.onApply,
  });

  final TextEditingController controller;
  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.local_offer_outlined,
              color: const Color(0xFF06A5D6),
              size: 18.sp,
            ),
            SizedBox(width: 8.w),
            AppText(
              'Promo Code',
              style: font18w500.copyWith(color: const Color(0xFF0F2B46)),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: AppFormField(
                controller: controller,
                hintText: 'Enter promo code',
                fillColor: AppLightColors.defaultBackground,
                radius: 30.r,
                borderColor: const Color(0xFFD2D8E1),
                focusedBorderColor: const Color(0xFF14AED3),
                borderWidth: 1,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              ),
            ),
            SizedBox(width: 8.w),
            AppButton(
              text: 'Apply',
              color: AppLightColors.buttonColor1,
              textSize: 16.sp,
              onPressed: onApply,
              radius: 30.r,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
          ],
        ),
      ],
    );
  }
}