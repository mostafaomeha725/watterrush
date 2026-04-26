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
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(color: const Color(0xFFDDE5F2)),
        ),
        child: Column(
          children: <Widget>[
            DeliverOrderCardHeader(order: order),
            Divider(
              height: 1.h,
              thickness: 1.h,
              color: const Color(0xFFE6ECF6),
            ),
            DeliverOrderCardBody(order: order),
          ],
        ),
      ),
    );
  }
}
