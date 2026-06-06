import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'orders_summary_item_widget.dart';

class OrdersSummaryBottomBar extends StatelessWidget {
  final int totalOrders;
  final double totalSpent;

  const OrdersSummaryBottomBar({
    super.key,
    required this.totalOrders,
    required this.totalSpent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: OrdersSummaryItemWidget(
                icon: Icons.shopping_bag_outlined,
                iconColor: const Color(0xFF6B58FA),
                title: 'Total Orders',
                value: '$totalOrders',
                valueColor: const Color(0xFF1B2028),
              ),
            ),
            Container(
              width: 1.w,
              height: 40.h,
              color: const Color(0xFFF3F4F6),
            ),
            Expanded(
              child: OrdersSummaryItemWidget(
                icon: Icons.account_balance_wallet_outlined,
                iconColor: const Color(0xFF6B58FA),
                title: 'Total Spent',
                value: 'EGP ${totalSpent.toStringAsFixed(2)}',
                valueColor: const Color(0xFF6B58FA),
                isRight: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
