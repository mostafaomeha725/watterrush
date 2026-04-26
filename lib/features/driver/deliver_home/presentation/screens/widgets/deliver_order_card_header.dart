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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 36.w,
            height: 36.w,
            decoration: const BoxDecoration(
              color: Color(0xFFF0F4FC),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              color: const Color(0xFF1870DF),
              size: 18.sp,
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppText(
                  order.customerName,
                  style: font18w700.copyWith(color: const Color(0xFF0B2650)),
                ),
                verticalSpacing(2),
                AppText(
                  '${order.orderId} · ${order.time}',
                  style: font12w500.copyWith(color: const Color(0xFF8A9AB0)),
                ),
              ],
            ),
          ),
          if (order.isCash)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7E8),
                borderRadius: BorderRadius.circular(999.r),
                border: Border.all(color: const Color(0xFFF8CA6A)),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.payments_outlined,
                    size: 12.sp,
                    color: const Color(0xFFE89D0C),
                  ),
                  horizontalSpacing(4),
                  AppText(
                    'Cash',
                    style: font12w700.copyWith(color: const Color(0xFFE89D0C)),
                  ),
                ],
              ),
            ),
          if (order.isCash) horizontalSpacing(8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F6FF),
              borderRadius: BorderRadius.circular(999.r),
            ),
            child: AppText(
              'New',
              style: font12w700.copyWith(color: const Color(0xFF1E69D8)),
            ),
          ),
        ],
      ),
    );
  }
}
