import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/bouncing_social_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class DriverProfileHeaderTopRow extends StatelessWidget {
  const DriverProfileHeaderTopRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AppText('My Profile', style: font20w700.copyWith(color: Colors.white)),
        const Spacer(),
        SizedBox(
          width: 96.w,
          child: BouncingSocialButton(
            text: 'Edit',
            onTap: () {},
            color: const Color(0x25FFFFFF),
            borderColor: const Color(0x55FFFFFF),
            textSize: 15.sp,
            radius: 28.r,
            height: 42.h,
            leading: Icon(
              Icons.edit_outlined,
              size: 16.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
