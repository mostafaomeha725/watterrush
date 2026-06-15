import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
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
    this.isAvailable = true,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onAddToCart;
  final bool isAdded;
  final String addButtonText;
  final String addedButtonText;
  final bool isLarge;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    if (!isAvailable) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF5F5),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xFFFFD6D6)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.hourglass_empty_rounded,
              size: 14.sp,
              color: const Color(0xFFE53935),
            ),
            SizedBox(width: 4.w),
            AppText(
              'Sold Out',
              style: font12w700.copyWith(color: const Color(0xFFE53935)),
            ),
          ],
        ),
      );
    }

    if (!isAdded) {
      return SizedBox(
        width: double.infinity,
        child: AppButton(
          text: addButtonText,
          onPressed: onAddToCart,
          color: const Color(0xFF1E73D9),
          radius: 12.r,
          height: isLarge ? 48.h : 38.h,
          textSize: isLarge ? 14.sp : 12.sp,
          textWeight: FontWeight.w700,
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isLarge ? 12.w : 6.w,
        vertical: isLarge ? 8.h : 6.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: onDecrement,
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: isLarge ? 34.w : 28.w,
              height: isLarge ? 34.w : 28.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                quantity > 1 ? Icons.remove : Icons.delete_outline_rounded,
                size: isLarge ? 18.sp : 16.sp,
                color: quantity > 1
                    ? const Color(0xFF1E73D9)
                    : const Color(0xFFE11D48),
              ),
            ),
          ),
          AppText(
            '$quantity',
            style: font14w700.copyWith(
              color: const Color(0xFF0F172A),
              fontSize: isLarge ? 18.sp : 15.sp,
            ),
          ),
          GestureDetector(
            onTap: onIncrement,
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: isLarge ? 34.w : 28.w,
              height: isLarge ? 34.w : 28.w,
              decoration: BoxDecoration(
                color: const Color(0xFF1E73D9),
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1E73D9).withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.add,
                size: isLarge ? 18.sp : 16.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
