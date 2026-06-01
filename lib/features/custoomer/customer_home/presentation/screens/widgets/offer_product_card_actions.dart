import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class OfferProductCardActions extends StatelessWidget {
  const OfferProductCardActions({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onAddToCart,
    this.isAdded = false,
    this.addButtonText = 'Add to Cart',
    this.addedButtonText = 'Added',
    this.isLarge = false,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onAddToCart;
  final bool isAdded;
  final String addButtonText;
  final String addedButtonText;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isLarge ? 12.w : 5.w,
            vertical: isLarge ? 8.h : 4.h,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F4F9),
            borderRadius: BorderRadius.circular(999.r),
          ),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: onDecrement,
                child: Container(
                  width: isLarge ? 32.w : 24.w,
                  height: isLarge ? 32.w : 24.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE7EDF6),
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Icon(
                    Icons.remove,
                    size: isLarge ? 18.sp : 15.sp,
                    color: const Color(0xFF5C7188),
                  ),
                ),
              ),
              horizontalSpacing(isLarge ? 16 : 10),
              AppText(
                '$quantity',
                style: font14w700.copyWith(
                  color: const Color(0xFF19324E),
                  fontSize: isLarge ? 18.sp : 14.sp,
                ),
              ),
              horizontalSpacing(isLarge ? 16 : 10),
              GestureDetector(
                onTap: onIncrement,
                child: Container(
                  width: isLarge ? 32.w : 24.w,
                  height: isLarge ? 32.w : 24.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D70D9),
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Icon(
                    Icons.add,
                    size: isLarge ? 18.sp : 15.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        horizontalSpacing(isLarge ? 16 : 8),
        Expanded(
          child: isAdded
              ? AppButton.icon(
                  text: addedButtonText,
                  onPressed: onAddToCart,
                  color: const Color(0xFF17B26A),
                  radius: 999.r,
                  height: isLarge ? 48.h : 38.h,
                  textSize: isLarge ? 14.sp : 12.sp,
                  textWeight: FontWeight.w700,
                  child: Icon(
                    Icons.check_rounded,
                    size: isLarge ? 18.sp : 14.sp,
                    color: Colors.white,
                  ),
                )
              : AppButton(
                  text: addButtonText,
                  onPressed: onAddToCart,
                  color: const Color(0xFF1E73D9),
                  radius: 999.r,
                  height: isLarge ? 48.h : 38.h,
                  textSize: isLarge ? 14.sp : 12.sp,
                  textWeight: FontWeight.w700,
                ),
        ),
      ],
    );
  }
}