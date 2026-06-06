import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_header.dart';

class OrdersHeaderWidget extends StatelessWidget {
  const OrdersHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          CheckoutHeader(
            isshow: false,
            onBackTap: () {
              GoRouter.of(context).pop();
            },
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'My Orders',
                  style: font20w700.copyWith(color: const Color(0xFF1B2028)),
                ),
                SizedBox(height: 2.h),
                AppText(
                  'Track and manage all your orders',
                  style: font12w400.copyWith(color: const Color(0xFF8B92A2)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
