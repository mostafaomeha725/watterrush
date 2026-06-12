import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class AllPopularProductsAppBar extends StatelessWidget {
  const AllPopularProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, size: 20.sp),
            onPressed: () => context.pop(),
          ),
          Expanded(
            child: AppText(
              'All Popular Products',
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
