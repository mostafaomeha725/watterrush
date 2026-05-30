import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class PaymentDeliveryDetailsCard extends StatelessWidget {
  const PaymentDeliveryDetailsCard({super.key, required this.onChangeTap});

  final VoidCallback onChangeTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFE5E9EF)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Delivery Address',
                      style: font18w700.copyWith(
                        color: const Color(0xFF0D223A),
                      ),
                    ),
                    verticalSpacing(4),
                    AppText(
                      '123 Main Street, Apt 4B',
                      style: font14w400.copyWith(
                        color: const Color(0xFF4A6075),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onChangeTap,
                child: AppText(
                  'Change',
                  style: font14w500.copyWith(color: const Color(0xFF0D9BD0)),
                ),
              ),
            ],
          ),
          verticalSpacing(12),
          Divider(height: 1, color: const Color(0xFFD9E0E7)),
          verticalSpacing(12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Delivery Time',
                      style: font18w700.copyWith(
                        color: const Color(0xFF0D223A),
                      ),
                    ),
                    verticalSpacing(4),
                    AppText(
                      'Deliver Now (15-20 mins)',
                      style: font14w400.copyWith(
                        color: const Color(0xFF4A6075),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16.sp,
                color: const Color(0xFF8A97A6),
              ),
            ],
          ),
        ],
      ),
    );
  }
}