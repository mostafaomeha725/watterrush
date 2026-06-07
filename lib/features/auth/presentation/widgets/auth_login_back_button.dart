import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';

class AuthLoginBackButton extends StatelessWidget {
  const AuthLoginBackButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: BounceIt(
        onPressed: onTap,
        child: Container(
          width: 38.w,
          height: 38.w,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.90),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF8AACD7).withValues(alpha: 0.20),
                blurRadius: 12.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 18.sp,
            color: const Color(0xFF294A7A),
          ),
        ),
      ),
    );
  }
}
