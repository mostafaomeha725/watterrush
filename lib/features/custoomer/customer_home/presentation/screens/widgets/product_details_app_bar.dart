import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: context.pop,
            child: Container(
              width: 38.w,
              height: 38.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F5FF),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xFFDDE6F7)),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: const Color(0xFF1A3F6F),
                size: 16.sp,
              ),
            ),
          ),
          Expanded(
            child: AppText(
              'Product Details',
              alignment: AlignmentDirectional.center,
              style: font18w700.copyWith(color: const Color(0xFF223A66)),
            ),
          ),
          SizedBox(width: 40.w), // Balance for back button
        ],
      ),
    );
  }
}
