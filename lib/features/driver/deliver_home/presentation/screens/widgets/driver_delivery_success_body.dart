import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_success_earnings_card.dart';

class DriverDeliverySuccessBody extends StatelessWidget {
  const DriverDeliverySuccessBody({super.key, required this.order});

  final DeliverOrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEDF1FB),
      width: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: <Widget>[
              const Spacer(),
              Container(
                width: 62.w,
                height: 62.w,
                decoration: const BoxDecoration(
                  color: Color(0xFF12B57A),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 32.sp,
                ),
              ),
              SizedBox(height: 18.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppText(
                    'Delivery Completed',
                    alignment: AlignmentDirectional.center,
                    style: font20w700.copyWith(color: const Color(0xFF102B54)),
                  ),
                  SizedBox(width: 6.w),
                  Icon(
                    Icons.celebration_rounded,
                    color: const Color(0xFF25A4F2),
                    size: 24.sp,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              AppText(
                'Great job, ${order.customerName}. The order was delivered successfully.',
                alignment: AlignmentDirectional.center,
                style: font16w500.copyWith(color: const Color(0xFF6E7F96)),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 22.h),
              DriverDeliverySuccessEarningsCard(
                orderAmount: order.priceLabel,
                isCash: order.isCash,
              ),
              SizedBox(height: 24.h),
              AppButton(
                text: 'Back to Orders',
                onPressed: () {
                  context.go(Routes.mainNavigationScreen, extra: false);
                },
                color: const Color(0xFF167FC8),
                textColor: Colors.white,
                textSize: 18.sp,
                textWeight: FontWeight.w700,
                radius: 20.r,
                height: 52.h,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}