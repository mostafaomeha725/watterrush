import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class SpecialOffersEmptyState extends StatelessWidget {
  const SpecialOffersEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppText(
              'Offers are unavailable.',
              style: font18w700.copyWith(color: const Color(0xFF153A63)),
              alignment: AlignmentDirectional.center,
            ),
            verticalSpacing(12),
            AppButton(
              text: 'Go Back',
              onPressed: context.pop,
              radius: 14.r,
              color: const Color(0xFF1E73D9),
              textSize: 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}