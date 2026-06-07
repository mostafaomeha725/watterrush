import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';
import 'order_timeline_step_widget.dart';

class OrderProgressTimelineWidget extends StatelessWidget {
  final OrderStatus currentStatus;

  const OrderProgressTimelineWidget({super.key, required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    final steps = [
      {
        'status': OrderStatus.pending,
        'title': 'Pending',
        'desc': 'We\'ve received your order',
      },
      {
        'status': OrderStatus.inProgress,
        'title': 'Confirmed',
        'desc': 'Your order is confirmed',
      }, // Mocking confirmed as inProgress for UI matching
      {
        'status': OrderStatus.inProgress,
        'title': 'Preparing',
        'desc': 'We are preparing your order',
      },
      {
        'status': OrderStatus.onTheWay,
        'title': 'On The Way',
        'desc': 'Your order is on the way',
      },
      {
        'status': OrderStatus.delivered,
        'title': 'Delivered',
        'desc': 'Order completed',
      },
    ];

    // For simplicity, find index. Pending=0, Confirmed=1, Preparing=2, OnTheWay=3, Delivered=4.
    int currentIndex = 0;
    if (currentStatus == OrderStatus.inProgress)
      currentIndex = 2; // Assuming preparing
    if (currentStatus == OrderStatus.onTheWay) currentIndex = 3;
    if (currentStatus == OrderStatus.delivered) currentIndex = 4;

    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Order Progress',
            style: font16w700.copyWith(color: const Color(0xFF0F2B46)),
          ),
          SizedBox(height: 20.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: steps.length,
            itemBuilder: (context, index) {
              final step = steps[index];
              final isCompleted = index < currentIndex;
              final isCurrent = index == currentIndex;

              return OrderTimelineStepWidget(
                title: step['title'] as String,
                desc: step['desc'] as String,
                isCompleted: isCompleted,
                isCurrent: isCurrent,
                isLast: index == steps.length - 1,
              );
            },
          ),
        ],
      ),
    );
  }
}
