import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/cubit/driver_delivery_details_state.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_header_top_row.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_status_banner.dart';

class DriverDeliveryDetailsHeader extends StatelessWidget {
  const DriverDeliveryDetailsHeader({super.key, required this.state});

  final DriverDeliveryDetailsState state;

  @override
  Widget build(BuildContext context) {
    Color stageColor = const Color(0xFF1AB57B);
    String stageTitle = 'Accepted';
    String stageSubtitle = 'Head to pickup point';
    IconData stageIcon = Icons.task_alt_rounded;

    switch (state.stage) {
      case DriverDeliveryStage.accepted:
        break;
      case DriverDeliveryStage.pickedUp:
        stageColor = const Color(0xFFF2A007);
        stageTitle = 'Picked Up';
        stageSubtitle = 'On your way to customer';
        stageIcon = Icons.inventory_rounded;
        break;
      case DriverDeliveryStage.onTheWay:
        stageColor = const Color(0xFF7A53F2);
        stageTitle = 'On The Way';
        stageSubtitle = 'Approaching destination';
        stageIcon = Icons.local_shipping_rounded;
        break;
      case DriverDeliveryStage.delivered:
        stageColor = const Color(0xFF12A974);
        stageTitle = 'Delivered';
        stageSubtitle = 'Order completed';
        stageIcon = Icons.celebration_rounded;
        break;
      case DriverDeliveryStage.rejected:
        stageColor = const Color(0xFFE34F5F);
        stageTitle = 'Rejected';
        stageSubtitle = state.rejectedReason ?? 'Delivery was rejected';
        stageIcon = Icons.cancel_outlined;
        break;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Color(0xFF194E9D), Color(0xFF0D8AE3)],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(14.w, 10.h, 14.w, 16.h),
          child: Column(
            children: <Widget>[
              DriverDeliveryHeaderTopRow(state: state),
              verticalSpacing(10),
              DriverDeliveryStatusBanner(
                title: stageTitle,
                subtitle: stageSubtitle,
                icon: stageIcon,
                color: stageColor,
                isCash: state.order.isCash,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
