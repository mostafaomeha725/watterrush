import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/track_order_circle_action_icon.dart';

class TrackOrderDriverEtaCard extends StatelessWidget {
  const TrackOrderDriverEtaCard({super.key, required this.onChatTap});

  final VoidCallback onChatTap;

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
            child: Icon(
              Icons.local_shipping_outlined,
              size: 24.sp,
              color: Colors.white,
            ),
          ),
          horizontalSpacing(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Driver on the way',
                  style: font18w500.copyWith(color: const Color(0xFF0D223A)),
                ),
                verticalSpacing(2),
                AppText(
                  'Arriving in 8 minutes',
                  style: font14w400.copyWith(color: const Color(0xFF5A6D81)),
                ),
              ],
            ),
          ),
          TrackOrderCircleActionIcon(
            icon: Icons.chat_bubble_outline_rounded,
            onTap: onChatTap,
          ),
        ],
      ),
    );
  }
}