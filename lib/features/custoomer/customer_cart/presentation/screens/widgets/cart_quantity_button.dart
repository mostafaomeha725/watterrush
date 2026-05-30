import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartQuantityButton extends StatelessWidget {
  const CartQuantityButton({
    super.key,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
  });

  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.w,
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF14AED3) : const Color(0xFFE9EEF2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 17.sp,
          color: isPrimary ? Colors.white : const Color(0xFF596B80),
        ),
      ),
    );
  }
}