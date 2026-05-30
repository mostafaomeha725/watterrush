import 'package:flutter/material.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CartPriceRow extends StatelessWidget {
  const CartPriceRow({
    super.key,
    required this.label,
    required this.value,
    required this.bold,
  });

  final String label;
  final double value;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          label,
          style: (bold ? font20w700 : font16w400).copyWith(
            color: const Color(0xFF0F2B46),
          ),
        ),
        AppText(
          '\$${value.toStringAsFixed(2)}',
          style: (bold ? font20w700 : font18w400).copyWith(
            color: bold ? const Color(0xFF0598D6) : const Color(0xFF2B3E56),
          ),
        ),
      ],
    );
  }
}