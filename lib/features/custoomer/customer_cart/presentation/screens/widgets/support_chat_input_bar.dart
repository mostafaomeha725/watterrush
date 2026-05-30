import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/app_form_field.dart';
import 'package:waterrush/core/widgets/custom_button.dart';

class SupportChatInputBar extends StatelessWidget {
  const SupportChatInputBar({
    super.key,
    required this.controller,
    required this.onSendTap,
    required this.onAttachmentTap,
  });

  final TextEditingController controller;
  final VoidCallback onSendTap;
  final VoidCallback onAttachmentTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onAttachmentTap,
          child: Icon(
            Icons.attach_file_rounded,
            size: 24.sp,
            color: const Color(0xFF2E445A),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: AppFormField(
            controller: controller,
            hintText: 'Type a message...',
            radius: 22.r,
            maxLines: 1,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 10.h,
            ),
            fillColor: const Color(0xFFF8FAFC),
            borderColor: const Color(0xFFDBE2EA),
            focusedBorderColor: const Color(0xFF9FD9EC),
          ),
        ),
        SizedBox(width: 8.w),
        SizedBox(
          width: 42.w,
          child: AppButton(
            text: '➤',
            onPressed: onSendTap,
            radius: 21.r,
            color: const Color(0xFF11B3E8),
            textColor: Colors.white,
            textSize: 16.sp,
            textWeight: FontWeight.w700,
            height: 42.h,
          ),
        ),
      ],
    );
  }
}