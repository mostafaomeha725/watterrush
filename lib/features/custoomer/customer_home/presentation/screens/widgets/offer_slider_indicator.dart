import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferSliderIndicator extends StatelessWidget {
  const OfferSliderIndicator({
    super.key,
    required this.padding,
    required this.itemCount,
    required this.currentOfferIndex,
  });

  final EdgeInsetsGeometry padding;
  final int itemCount;
  final int currentOfferIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(itemCount, (index) {
          final bool isActive = currentOfferIndex == index;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            width: 6.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFF177CF5)
                  : const Color(0xFFD6E4F3),
              shape: BoxShape.circle,
            ),
          );
        }),
      ),
    );
  }
}