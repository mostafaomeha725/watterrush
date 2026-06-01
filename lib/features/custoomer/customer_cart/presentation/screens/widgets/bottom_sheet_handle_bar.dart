import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetHandleBar extends StatelessWidget {
  const BottomSheetHandleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50.w,
        height: 5.h,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
