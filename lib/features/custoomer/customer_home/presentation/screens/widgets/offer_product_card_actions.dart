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
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onAddToCart;
  final bool isAdded;
  final String addButtonText;
  final String addedButtonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F4F9),
            borderRadius: BorderRadius.circular(999.r),
          ),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: onDecrement,
                child: Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE7EDF6),
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Icon(
                    Icons.remove,
                    size: 15.sp,
                    color: const Color(0xFF5C7188),
                  ),
                ),
              ),
              horizontalSpacing(10),
              AppText(
                '$quantity',
                style: font14w700.copyWith(color: const Color(0xFF19324E)),
              ),
              horizontalSpacing(10),
              GestureDetector(
                onTap: onIncrement,
                child: Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D70D9),
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Icon(Icons.add, size: 15.sp, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        horizontalSpacing(8),
        Expanded(
          child: isAdded
              ? AppButton.icon(
                  text: addedButtonText,
                  onPressed: onAddToCart,
                  color: const Color(0xFF17B26A),
                  radius: 999.r,
                  height: 38.h,
                  textSize: 12.sp,
                  textWeight: FontWeight.w700,
                  child: Icon(
                    Icons.check_rounded,
                    size: 14.sp,
                    color: Colors.white,
                  ),
                )
              : AppButton(
                  text: addButtonText,
                  onPressed: onAddToCart,
                  color: const Color(0xFF1E73D9),
                  radius: 999.r,
                  height: 38.h,
                  textSize: 12.sp,
                  textWeight: FontWeight.w700,
                ),
        ),
      ],
    );
  }
}