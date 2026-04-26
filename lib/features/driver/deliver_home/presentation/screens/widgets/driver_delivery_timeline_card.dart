import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/cubit/driver_delivery_details_state.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_timeline_step_row.dart';

class DriverDeliveryTimelineCard extends StatelessWidget {
  const DriverDeliveryTimelineCard({super.key, required this.state});

  final DriverDeliveryDetailsState state;

  @override
  Widget build(BuildContext context) {
    int activeIndex = 0;
    switch (state.progressStage) {
      case DriverDeliveryStage.accepted:
        activeIndex = 0;
        break;
      case DriverDeliveryStage.pickedUp:
        activeIndex = 1;
        break;
      case DriverDeliveryStage.onTheWay:
        activeIndex = 2;
        break;
      case DriverDeliveryStage.delivered:
        activeIndex = 3;
        break;
      case DriverDeliveryStage.rejected:
        activeIndex = 0;
        break;
    }

    final List<Map<String, String>> stages = <Map<String, String>>[
      <String, String>{'title': 'Accepted', 'subtitle': 'Head to pickup point'},
      <String, String>{
        'title': 'Picked Up',
        'subtitle': 'On your way to customer',
      },
      <String, String>{
        'title': 'On The Way',
        'subtitle': 'Approaching destination',
      },
      <String, String>{'title': 'Delivered', 'subtitle': 'Order completed'},
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFDDE5F2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppText(
            'Delivery Stages',
            style: font14w700.copyWith(color: const Color(0xFF93A3B9)),
          ),
          verticalSpacing(10),
          ...List<Widget>.generate(stages.length, (int index) {
            final bool isCompleted = index < activeIndex;
            final bool isActive = index == activeIndex;
            final bool showConnector = index != stages.length - 1;

            return DriverDeliveryTimelineStepRow(
              title: stages[index]['title']!,
              subtitle: stages[index]['subtitle']!,
              isActive: isActive,
              isCompleted: isCompleted,
              showConnector: showConnector,
            );
          }),
        ],
      ),
    );
  }
}
