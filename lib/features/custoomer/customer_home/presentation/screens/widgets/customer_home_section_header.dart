import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CustomerHomeSectionHeader extends StatelessWidget {
  const CustomerHomeSectionHeader({
    required this.title,
    required this.onSeeAll,
    super.key,
  });

  final String title;
  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF223A66),
          ),
        ),
        BounceIt(
          onPressed: onSeeAll,
          child: Row(
            children: [
              AppText(
                'See All',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2A86F5),
                ),
              ),
              SizedBox(width: 2.w),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 11.sp,
                color: const Color(0xFF2A86F5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
