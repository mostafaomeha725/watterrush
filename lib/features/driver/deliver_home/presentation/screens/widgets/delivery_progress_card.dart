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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: const LinearGradient(
            colors: <Color>[Color(0xFF15BA85), Color(0xFF099F71)],
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xFF18AC84).withValues(alpha: 0.18),
              blurRadius: 14.r,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 46.w,
              height: 46.w,
              decoration: const BoxDecoration(
                color: Color(0x2EFFFFFF),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.local_shipping_outlined,
                color: const Color(0xFFE6FFF6),
                size: 24.sp,
              ),
            ),
            horizontalSpacing(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    'Delivery In Progress',
                    style: font16w700.copyWith(color: Colors.white),
                  ),
                  verticalSpacing(2),
                  AppText(
                    'Tap to track your current delivery',
                    style: font12w500.copyWith(color: const Color(0xFFE8FFF8)),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: Colors.white, size: 28.sp),
          ],
        ),
      ),
    );
  }
}
