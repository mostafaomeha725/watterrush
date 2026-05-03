import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';

class DeliverOrderCardHeader extends StatelessWidget {
  const DeliverOrderCardHeader({super.key, required this.order});

  final DeliverOrderModel order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 42.w,
            height: 42.w,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xFFE4EEFF), Color(0xFFCCDEFF)],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.inventory_2_rounded,
              color: const Color(0xFF1464D8),
              size: 19.sp,
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppText(
                  order.customerName,
                  style: font16w700.copyWith(color: const Color(0xFF0B2650)),
                ),
                verticalSpacing(2),
                AppText(
                  '${order.orderId} · ${order.time}',
                  style: font12w500.copyWith(color: const Color(0xFF9BABC4)),
                ),
              ],
            ),
          ),
          if (order.isCash) ...<Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7E8),
                borderRadius: BorderRadius.circular(999.r),
                border: Border.all(color: const Color(0xFFF5C84A), width: 1),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.payments_rounded,
                    size: 11.sp,
                    color: const Color(0xFFCB8C00),
                  ),
                  horizontalSpacing(4),
                  AppText(
                    'Cash',
                    style: font12w700.copyWith(color: const Color(0xFFCB8C00)),
                  ),
                ],
              ),
            ),
            horizontalSpacing(6),
          ],
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: <Color>[Color(0xFF1A6EE8), Color(0xFF1060CC)],
              ),
              borderRadius: BorderRadius.circular(999.r),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFF1464D8).withValues(alpha: 0.30),
                  blurRadius: 8.r,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: AppText(
              'New',
              style: font12w700.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
