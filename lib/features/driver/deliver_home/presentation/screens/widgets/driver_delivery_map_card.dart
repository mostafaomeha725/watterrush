import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';

class DriverDeliveryMapCard extends StatelessWidget {
  const DriverDeliveryMapCard({super.key, required this.order});

  final DeliverOrderModel order;

  @override
  Widget build(BuildContext context) {
    return BounceIt(
      onPressed: () {
        context.push(Routes.driverDeliveryMapScreen, extra: order);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: const Color(0xFFDDE5F2)),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 40.w,
              height: 40.w,
              decoration: const BoxDecoration(
                color: Color(0xFFF0F4FC),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.navigation_outlined,
                color: const Color(0xFF1E69D8),
                size: 20.sp,
              ),
            ),
            horizontalSpacing(10),
            Expanded(
              child: AppText(
                'Open Delivery Map',
                style: font16w700.copyWith(color: const Color(0xFF1360C4)),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: const Color(0xFFA2B0C3),
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}