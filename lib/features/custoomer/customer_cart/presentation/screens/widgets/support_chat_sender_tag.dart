import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/core/theme/styles.dart';

class SupportChatSenderTag extends StatelessWidget {
  const SupportChatSenderTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20.w,
          height: 20.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF11AEE6),
          ),
          alignment: Alignment.center,
          child: AppText(
            'S',
            style: font10w700.copyWith(color: Colors.white),
            alignment: AlignmentDirectional.center,
          ),
        ),
        horizontalSpacing(6),
        AppText(
          'Support',
          style: font12w500.copyWith(color: const Color(0xFF5B7185)),
        ),
      ],
    );
  }
}
