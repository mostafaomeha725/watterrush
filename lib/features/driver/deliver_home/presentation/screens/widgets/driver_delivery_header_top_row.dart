import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/helpers/helpers.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/cubit/driver_delivery_details_state.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';

class DriverDeliveryHeaderTopRow extends StatelessWidget {
  const DriverDeliveryHeaderTopRow({super.key, required this.state});

  final DriverDeliveryDetailsState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        BounceIt(
          onPressed: context.pop,
          child: Container(
            width: 42.w,
            height: 42.w,
            decoration: const BoxDecoration(
              color: Color(0x2AFFFFFF),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 22.sp,
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              AppText(
                'Order ${state.order.orderId}',
                alignment: AlignmentDirectional.center,
                style: font12w500.copyWith(color: const Color(0xFFD7E7FF)),
              ),
              AppText(
                state.stage == DriverDeliveryStage.delivered
                    ? 'Delivery Completed'
                    : state.stage == DriverDeliveryStage.rejected
                    ? 'Delivery Rejected'
                    : 'Delivery In Progress',
                alignment: AlignmentDirectional.center,
                style: font18w700.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        BounceIt(
          onPressed: () {
            LauncherHelper.callPhone(phone: state.order.customerPhone);
          },
          child: Container(
            width: 42.w,
            height: 42.w,
            decoration: const BoxDecoration(
              color: Color(0x2A00E29B),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.phone_in_talk_outlined,
              color: const Color(0xFF0EE08E),
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}
