import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class OrdersListHeaderWidget extends StatelessWidget {
  const OrdersListHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            'Order List',
            style: font14w500.copyWith(
              color: const Color(0xFF1B2028),
              fontWeight: FontWeight.w600,
            ),
          ),
          // Row(
          //   children: [
          //     AppText(
          //       'Latest First',
          //       style: font12w400.copyWith(color: const Color(0xFF6B7280)),
          //     ),
          //     SizedBox(width: 4.w),
          //     Icon(
          //       Icons.keyboard_arrow_down_rounded,
          //       color: const Color(0xFF6B7280),
          //       size: 16.sp,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
