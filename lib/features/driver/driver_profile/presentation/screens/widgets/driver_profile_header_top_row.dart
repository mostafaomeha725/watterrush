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
          width: 90.w,
          child: BouncingSocialButton(
            text: 'Edit',
            onTap: () {},
            color: const Color(0x33FFFFFF),
            borderColor: const Color(0x66FFFFFF),
            textSize: 16.sp,
            //  textWeight: FontWeight.w700,
            radius: 26.r,
            height: 44.h,
            leading: Icon(
              Icons.edit_outlined,
              size: 18.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
