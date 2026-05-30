import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class PaymentOrderSummaryCard extends StatelessWidget {
  const PaymentOrderSummaryCard({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Order Summary',
            style: font16w700.copyWith(color: const Color(0xFF0D223A)),
          ),
          verticalSpacing(14),
          _SummaryRow(label: 'Items Total', value: '\$30.97'),
          verticalSpacing(8),
          _SummaryRow(label: 'Delivery Fee', value: '\$2.99'),
          verticalSpacing(8),
          _SummaryRow(
            label: 'Discount (RUSH20)',
            value: '-\$6.19',
            valueColor: const Color(0xFF039F4A),
            labelColor: const Color(0xFF039F4A),
          ),
          verticalSpacing(10),
          Divider(height: 1, color: const Color(0xFFD9E0E7)),
          verticalSpacing(10),
          _SummaryRow(
            label: 'Total',
            value: '\$27.77',
            isBold: true,
            valueColor: const Color(0xFF038AB8),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.valueColor,
    this.labelColor,
    this.isBold = false,
  });

  final String label;
  final String value;
  final Color? valueColor;
  final Color? labelColor;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppText(
            label,
            style: (isBold ? font18w700 : font16w500).copyWith(
              color: labelColor ?? const Color(0xFF30465D),
            ),
          ),
        ),
        AppText(
          value,
          style: (isBold ? font20w700 : font16w700).copyWith(
            color: valueColor ?? const Color(0xFF081A31),
          ),
        ),
      ],
    );
  }
}