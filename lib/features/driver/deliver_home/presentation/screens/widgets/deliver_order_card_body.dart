import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';

class DeliverOrderCardBody extends StatelessWidget {
  const DeliverOrderCardBody({super.key, required this.order});

  final DeliverOrderModel order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.location_on_outlined,
                color: const Color(0xFF1E69D8),
                size: 16.sp,
              ),
              horizontalSpacing(6),
              Expanded(
                child: AppText(
                  order.address,
                  style: font12w500.copyWith(color: const Color(0xFF27466F)),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          verticalSpacing(8),
          ...order.items.map(
            (String item) => Padding(
              padding: EdgeInsetsDirectional.only(start: 22.w, bottom: 3.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Icon(
                      Icons.circle,
                      size: 4.sp,
                      color: const Color(0xFF8CB0E3),
                    ),
                  ),
                  horizontalSpacing(8),
                  Expanded(
                    child: AppText(
                      item,
                      style: font12w500.copyWith(
                        color: const Color(0xFF53749E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          verticalSpacing(10),
          Row(
            children: <Widget>[
              Icon(
                Icons.place_outlined,
                size: 15.sp,
                color: const Color(0xFF93A3BB),
              ),
              horizontalSpacing(4),
              AppText(
                '${order.distanceKm.toStringAsFixed(1)} km',
                style: font12w500.copyWith(color: const Color(0xFF8A9AB0)),
              ),
              horizontalSpacing(14),
              Icon(
                Icons.access_time_rounded,
                size: 14.sp,
                color: const Color(0xFF93A3BB),
              ),
              horizontalSpacing(4),
              AppText(
                '${order.etaMinutes} min',
                style: font12w500.copyWith(color: const Color(0xFF8A9AB0)),
              ),
              const Spacer(),
              AppText(
                order.priceLabel,
                style: font20w700.copyWith(color: const Color(0xFF1460C2)),
              ),
              horizontalSpacing(8),
              Icon(
                Icons.chevron_right_rounded,
                color: const Color(0xFFA2B0C3),
                size: 24.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
