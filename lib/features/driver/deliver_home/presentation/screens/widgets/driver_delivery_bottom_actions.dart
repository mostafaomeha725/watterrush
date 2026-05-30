import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/cubit/driver_delivery_details_state.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';

class DriverDeliveryBottomActions extends StatelessWidget {
  const DriverDeliveryBottomActions({
    super.key,
    required this.state,
    required this.onBackTap,
    required this.onRejectTap,
    required this.onPrimaryTap,
  });

  final DriverDeliveryDetailsState state;
  final VoidCallback onBackTap;
  final VoidCallback? onRejectTap;
  final VoidCallback onPrimaryTap;

  @override
  Widget build(BuildContext context) {
    String primaryText = 'Picked Up';
    Color primaryColor = const Color(0xFFF2A007);

    switch (state.stage) {
      case DriverDeliveryStage.accepted:
        break;
      case DriverDeliveryStage.pickedUp:
        primaryText = 'On The Way';
        primaryColor = const Color(0xFF6E47EE);
        break;
      case DriverDeliveryStage.onTheWay:
        primaryText = 'Delivered';
        primaryColor = const Color(0xFF16B57B);
        break;
      case DriverDeliveryStage.delivered:
        primaryText = 'Delivered ✓';
        primaryColor = const Color(0xFF16B57B);
        break;
      case DriverDeliveryStage.rejected:
        primaryText = 'Rejected';
        primaryColor = const Color(0xFFE34F5F);
        break;
    }

    return SafeArea(
      top: false,
      child: Container(
        padding: EdgeInsets.fromLTRB(14.w, 8.h, 14.w, 10.h),
        color: const Color(0xFFEEF1F9),
        child: Column(
          children: <Widget>[
            AppButton(
              text: 'Reject',
              onPressed: onRejectTap,
              color: const Color(0xFFFFF1F2),
              textColor: const Color(0xFFE34F5F),
              borderColor: const Color(0xFFF6B9C1),
              textSize: 16.sp,
              radius: 18.r,
            ),
            SizedBox(height: 10.h),
            AppButton(
              text: primaryText,
              onPressed: state.isDelivered || state.isRejected
                  ? null
                  : onPrimaryTap,
              color: primaryColor,
              textSize: 18.sp,
              textWeight: FontWeight.w700,
              radius: 20.r,
              height: 56.h,
            ),
          ],
        ),
      ),
    );
  }
}