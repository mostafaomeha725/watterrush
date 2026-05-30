import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class SupportChatMessageBubble extends StatelessWidget {
  const SupportChatMessageBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isUser,
  });

  final String message;
  final String time;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    final double bubbleMaxWidth = 272.w;

    return Align(
      alignment: isUser
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: bubbleMaxWidth),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isUser ? const Color(0xFF10B4E8) : const Color(0xFFF7F8FA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14.r),
                topRight: Radius.circular(14.r),
                bottomLeft: Radius.circular(isUser ? 14.r : 4.r),
                bottomRight: Radius.circular(isUser ? 4.r : 14.r),
              ),
              border: Border.all(
                color: isUser
                    ? const Color(0xFF10B4E8)
                    : const Color(0xFFD8DEE7),
              ),
            ),
            child: AppText(
              message,
              style: font16w500.copyWith(
                color: isUser ? Colors.white : const Color(0xFF0F2742),
              ),
              maxLines: 10,
            ),
          ),
          verticalSpacing(4),
          SizedBox(
            width: bubbleMaxWidth,
            child: AppText(
              time,
              alignment: isUser
                  ? AlignmentDirectional.centerEnd
                  : AlignmentDirectional.centerStart,
              textAlign: isUser ? TextAlign.end : TextAlign.start,
              style: font12w400.copyWith(color: const Color(0xFF667B8E)),
            ),
          ),
        ],
      ),
    );
  }
}