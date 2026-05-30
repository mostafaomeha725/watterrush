import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class DeliveryProgressCard extends StatelessWidget {
  const DeliveryProgressCard({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BounceIt(
      onPressed: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Color(0xFF0CB87A), Color(0xFF069A64)],
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xFF0CB87A).withValues(alpha: 0.32),
              blurRadius: 18.r,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 48.w,
              height: 48.w,
              decoration: const BoxDecoration(
                color: Color(0x25FFFFFF),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.local_shipping_rounded,
                color: const Color(0xFFE8FFF6),
                size: 24.sp,
              ),
            ),
            horizontalSpacing(14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    'Delivery In Progress',
                    style: font16w700.copyWith(color: Colors.white),
                  ),
                  verticalSpacing(3),
                  AppText(
                    'Tap to track your current delivery',
                    style: font12w500.copyWith(color: const Color(0xFFD0FFF0)),
                  ),
                ],
              ),
            ),
            Container(
              width: 32.w,
              height: 32.w,
              decoration: const BoxDecoration(
                color: Color(0x20FFFFFF),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
                size: 22.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}