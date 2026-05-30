import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/app_form_field.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CheckoutDeliveryInstructionsSection extends StatelessWidget {
  const CheckoutDeliveryInstructionsSection({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'Delivery Instructions (Optional)',
          style: font18w700.copyWith(color: const Color(0xFF0F2B46)),
        ),
        verticalSpacing(10),
        AppFormField(
          controller: controller,
          hintText: 'Add delivery instructions...',
          minLines: 3,
          maxLines: 3,
          radius: 16.r,
          borderWidth: 1,
          borderColor: const Color(0xFFD2D8E1),
          focusedBorderColor: const Color(0xFF14AED3),
          fillColor: AppLightColors.defaultBackground,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 14.h,
          ),
        ),
      ],
    );
  }
}