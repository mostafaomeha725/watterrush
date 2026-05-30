import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/helpers/helpers.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';

class DriverDeliveryCustomerCard extends StatelessWidget {
  const DriverDeliveryCustomerCard({super.key, required this.order});

  final DeliverOrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFDDE5F2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppText(
            'Customer Details',
            style: font16w700.copyWith(color: const Color(0xFF93A3B9)),
          ),
          verticalSpacing(10),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: const BoxDecoration(
                  color: Color(0xFFF0F4FC),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: AppText(
                    order.customerName.characters.first,
                    alignment: AlignmentDirectional.center,
                    style: font24w700.copyWith(color: const Color(0xFF1767CB)),
                  ),
                ),
              ),
              horizontalSpacing(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText(
                      order.customerName,
                      style: font18w700.copyWith(
                        color: const Color(0xFF112A49),
                      ),
                    ),
                    AppText(
                      order.customerPhone,
                      style: font14w500.copyWith(
                        color: const Color(0xFF0873D1),
                      ),
                    ),
                  ],
                ),
              ),
              BounceIt(
                onPressed: () {
                  LauncherHelper.callPhone(phone: order.customerPhone);
                },
                child: Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9FBF4),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: const Color(0xFFA4EBCB)),
                  ),
                  child: Icon(
                    Icons.phone_outlined,
                    color: const Color(0xFF11BE7D),
                    size: 22.sp,
                  ),
                ),
              ),
            ],
          ),
          verticalSpacing(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.location_on_outlined,
                color: const Color(0xFF1E69D8),
                size: 17.sp,
              ),
              horizontalSpacing(6),
              Expanded(
                child: AppText(
                  order.address,
                  style: font12w500.copyWith(color: const Color(0xFF27466F)),
                ),
              ),
            ],
          ),
          verticalSpacing(8),
          Row(
            children: <Widget>[
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
              horizontalSpacing(16),
              Icon(
                Icons.place_outlined,
                size: 14.sp,
                color: const Color(0xFF93A3BB),
              ),
              horizontalSpacing(4),
              AppText(
                '${order.distanceKm.toStringAsFixed(1)} km',
                style: font12w500.copyWith(color: const Color(0xFF8A9AB0)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}