import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/helpers/helpers.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_map_stats_chip.dart';

class DriverDeliveryMapTopOverlay extends StatelessWidget {
  const DriverDeliveryMapTopOverlay({
    super.key,
    required this.order,
    required this.remainingEtaMinutes,
    required this.remainingDistanceKm,
    required this.isCompleted,
  });

  final DeliverOrderModel order;
  final int remainingEtaMinutes;
  final double remainingDistanceKm;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final String statusText = isCompleted
        ? 'Arrived at customer'
        : 'Tracking between you and customer';

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            BounceIt(
              onPressed: context.pop,
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.92),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFD6E0EF)),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 16.sp,
                  color: const Color(0xFF2A5B9B),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 7.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.95),
                    borderRadius: BorderRadius.circular(999.r),
                    border: Border.all(color: const Color(0xFFD6E0EF)),
                  ),
                  child: AppText(
                    statusText,
                    style: font14w700.copyWith(color: const Color(0xFF12396C)),
                  ),
                ),
              ),
            ),
            BounceIt(
              onPressed: () {
                LauncherHelper.callPhone(phone: order.customerPhone);
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFDCF8EE),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF9CE5C7)),
                ),
                child: Icon(
                  Icons.call_rounded,
                  size: 18.sp,
                  color: const Color(0xFF1AAE77),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: <Widget>[
            Expanded(
              child: DriverDeliveryMapStatsChip(
                value: '$remainingEtaMinutes min',
                label: 'ETA',
                icon: Icons.schedule_rounded,
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: DriverDeliveryMapStatsChip(
                value: '${remainingDistanceKm.toStringAsFixed(1)} km',
                label: 'Distance',
                icon: Icons.place_outlined,
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: DriverDeliveryMapStatsChip(
                value: order.isCash ? 'Cash' : 'Card',
                label: 'Payment',
                icon: Icons.payments_outlined,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
