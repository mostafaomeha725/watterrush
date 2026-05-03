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
                Icons.location_on_rounded,
                color: const Color(0xFF1464D8),
                size: 16.sp,
              ),
              horizontalSpacing(6),
              Expanded(
                child: AppText(
                  order.address,
                  style: font12w500.copyWith(color: const Color(0xFF3D5880)),
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
                    padding: EdgeInsets.only(top: 7.h),
                    child: Container(
                      width: 4.w,
                      height: 4.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFF9BB8E8),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  horizontalSpacing(8),
                  Expanded(
                    child: AppText(
                      item,
                      style: font12w500.copyWith(
                        color: const Color(0xFF5A7BA6),
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F5FF),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.straighten_rounded,
                      size: 12.sp,
                      color: const Color(0xFF6B8FC4),
                    ),
                    horizontalSpacing(4),
                    AppText(
                      '${order.distanceKm.toStringAsFixed(1)} km',
                      style: font12w700.copyWith(
                        color: const Color(0xFF3D5F90),
                      ),
                    ),
                  ],
                ),
              ),
              horizontalSpacing(8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F5FF),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_time_rounded,
                      size: 12.sp,
                      color: const Color(0xFF6B8FC4),
                    ),
                    horizontalSpacing(4),
                    AppText(
                      '${order.etaMinutes} min',
                      style: font12w700.copyWith(
                        color: const Color(0xFF3D5F90),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              AppText(
                order.priceLabel,
                style: font18w700.copyWith(color: const Color(0xFF0D3E9E)),
              ),
              horizontalSpacing(4),
              Icon(
                Icons.chevron_right_rounded,
                color: const Color(0xFF1464D8),
                size: 22.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
