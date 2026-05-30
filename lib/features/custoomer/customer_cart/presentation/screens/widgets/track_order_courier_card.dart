import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class TrackOrderCourierCard extends StatelessWidget {
  const TrackOrderCourierCard({super.key});

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
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF0EA5E9),
            ),
            alignment: Alignment.center,
            child: AppText(
              'JD',
              style: font16w500.copyWith(color: Colors.white),
              alignment: AlignmentDirectional.center,
            ),
          ),
          horizontalSpacing(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'John Doe',
                  style: font18w500.copyWith(color: const Color(0xFF0D223A)),
                ),
                verticalSpacing(2),
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: const Color(0xFFF5B60A),
                      size: 16.sp,
                    ),
                    horizontalSpacing(2),
                    AppText(
                      '4.8 (250 deliveries)',
                      style: font12w400.copyWith(
                        color: const Color(0xFF5A6D81),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                'Vehicle',
                style: font12w400.copyWith(color: const Color(0xFF718497)),
              ),
              verticalSpacing(2),
              AppText(
                'ABC 1234',
                style: font20w500.copyWith(color: const Color(0xFF0D223A)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}