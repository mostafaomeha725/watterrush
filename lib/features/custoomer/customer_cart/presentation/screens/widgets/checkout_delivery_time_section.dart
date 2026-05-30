import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/app_form_field.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_delivery_option_card.dart';

class CheckoutDeliveryTimeSection extends StatelessWidget {
  const CheckoutDeliveryTimeSection({
    super.key,
    required this.isScheduleSelected,
    required this.dateTimeController,
    required this.onDeliverNowTap,
    required this.onScheduleTap,
    required this.onDateTimeTap,
  });

  final bool isScheduleSelected;
  final TextEditingController dateTimeController;
  final VoidCallback onDeliverNowTap;
  final VoidCallback onScheduleTap;
  final VoidCallback onDateTimeTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'Delivery Time',
          style: font18w700.copyWith(color: const Color(0xFF0F2B46)),
        ),
        verticalSpacing(10),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFFE3E8EF)),
          ),
          child: Row(
            children: [
              Expanded(
                child: CheckoutDeliveryOptionCard(
                  title: 'Deliver Now',
                  subtitle: '15-20 mins',
                  icon: Icons.flash_on_outlined,
                  isSelected: !isScheduleSelected,
                  onTap: onDeliverNowTap,
                ),
              ),
              horizontalSpacing(10),
              Expanded(
                child: CheckoutDeliveryOptionCard(
                  title: 'Schedule',
                  subtitle: 'Pick time',
                  icon: Icons.access_time_rounded,
                  isSelected: isScheduleSelected,
                  onTap: onScheduleTap,
                ),
              ),
            ],
          ),
        ),
        if (isScheduleSelected) ...[
          verticalSpacing(18),
          AppText(
            'Select Date & Time',
            style: font16w500.copyWith(color: const Color(0xFF0F2B46)),
          ),
          verticalSpacing(10),
          AppFormField(
            controller: dateTimeController,
            hintText: 'mm/dd/yyyy  --:-- --',
            readOnly: true,
            onTap: onDateTimeTap,
            fillColor: AppLightColors.defaultBackground,
            radius: 30.r,
            borderColor: const Color(0xFFD2D8E1),
            focusedBorderColor: const Color(0xFF14AED3),
            borderWidth: 1,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            suffixIcon: Icon(
              Icons.calendar_today_outlined,
              size: 18.sp,
              color: const Color(0xFF1A2F47),
            ),
          ),
        ],
      ],
    );
  }
}