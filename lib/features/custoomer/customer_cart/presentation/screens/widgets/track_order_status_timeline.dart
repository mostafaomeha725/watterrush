import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class TrackOrderStatusTimeline extends StatelessWidget {
  const TrackOrderStatusTimeline({super.key});

  static const List<Map<String, String>> _statuses = [
    {'title': 'Order Placed', 'time': '2:45 PM'},
    {'title': 'Confirmed', 'time': '2:46 PM'},
    {'title': 'Out for Delivery', 'time': '2:52 PM'},
    {'title': 'Delivered', 'time': 'Expected 3:05 PM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFE2E8EF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Order Status',
            style: font20w700.copyWith(color: const Color(0xFF0C223A)),
          ),
          verticalSpacing(10),
          ...List.generate(_statuses.length, (index) {
            final bool isLast = index == _statuses.length - 1;
            final Map<String, String> item = _statuses[index];

            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 26.w,
                          height: 26.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFC5F0D8),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 16.sp,
                            color: const Color(0xFF00A450),
                          ),
                        ),
                        if (!isLast)
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 4.h),
                            width: 2.w,
                            height: 50.h,
                            color: const Color(0xFF00B85E),
                          ),
                      ],
                    ),
                  ),
                  horizontalSpacing(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppText(
                          item['title'] ?? '',
                          style: font18w500.copyWith(
                            color: const Color(0xFF091D35),
                          ),
                        ),
                        verticalSpacing(2),
                        AppText(
                          item['time'] ?? '',
                          maxLines: 2,
                          style: font14w400.copyWith(
                            color: const Color(0xFF657A8E),
                          ),
                        ),
                        if (!isLast) verticalSpacing(8),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}