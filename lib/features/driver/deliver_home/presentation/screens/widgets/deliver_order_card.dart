import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_order_card_body.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_order_card_header.dart';

class DeliverOrderCard extends StatelessWidget {
  const DeliverOrderCard({super.key, required this.order, this.onTap});

  final DeliverOrderModel order;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BounceIt(
      onPressed: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xFF1464D8).withValues(alpha: 0.08),
              blurRadius: 20.r,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: const Color(0xFF0C2461).withValues(alpha: 0.04),
              blurRadius: 4.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            DeliverOrderCardHeader(order: order),
            Container(
              height: 1.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              color: const Color(0xFFF0F4FC),
            ),
            DeliverOrderCardBody(order: order),
          ],
        ),
      ),
    );
  }
}