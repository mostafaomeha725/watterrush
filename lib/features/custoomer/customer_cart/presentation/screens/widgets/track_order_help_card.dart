import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class TrackOrderHelpCard extends StatelessWidget {
  const TrackOrderHelpCard({super.key, required this.onChatTap});

  final VoidCallback onChatTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F6FC),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF0EA5E9),
            ),
            alignment: Alignment.center,
            child: AppText(
              '?',
              style: font20w500.copyWith(color: Colors.white),
              alignment: AlignmentDirectional.center,
            ),
          ),
          horizontalSpacing(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Need Help?',
                  style: font18w500.copyWith(color: const Color(0xFF0D223A)),
                ),
                verticalSpacing(2),
                AppText(
                  'Contact our support team 24/7',
                  style: font14w400.copyWith(color: const Color(0xFF5B7185)),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onChatTap,
            child: AppText(
              'Chat',
              style: font16w500.copyWith(color: const Color(0xFF0D9BD0)),
            ),
          ),
        ],
      ),
    );
  }
}