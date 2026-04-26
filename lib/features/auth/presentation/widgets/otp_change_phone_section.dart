import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class OtpChangePhoneSection extends StatelessWidget {
  const OtpChangePhoneSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BounceIt(
      onPressed: context.pop,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.phone_outlined,
            size: 18.sp,
            color: const Color(0xFF4FA2FF),
          ),
          SizedBox(width: 8.w),
          AppText(
            'Change Phone Number',
            style: font16w500.copyWith(color: const Color(0xFF3D9AFF)),
          ),
        ],
      ),
    );
  }
}
