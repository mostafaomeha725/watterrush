import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/helpers/helpers.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';

class DriverDeliveryMapBottomCard extends StatelessWidget {
  const DriverDeliveryMapBottomCard({super.key, required this.order});

  final DeliverOrderModel order;

  @override
  Widget build(BuildContext context) {
    final String customerInitial = order.customerName.trim().isEmpty
        ? 'C'
        : order.customerName.trim()[0].toUpperCase();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(14.w, 10.h, 14.w, 18.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 48.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: const Color(0xFFD8E1EF),
                borderRadius: BorderRadius.circular(999.r),
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: <Widget>[
                Container(
                  width: 38.w,
                  height: 38.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE9EFFA),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: AppText(
                      customerInitial,
                      style: font16w700.copyWith(
                        color: const Color(0xFF1D5FBA),
                      ),
                      alignment: AlignmentDirectional.center,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppText(
                        order.customerName,
                        style: font16w700.copyWith(
                          color: const Color(0xFF102E59),
                        ),
                      ),
                      AppText(
                        order.address,
                        style: font12w500.copyWith(
                          color: const Color(0xFF8FA3BF),
                        ),
                      ),
                    ],
                  ),
                ),
                BounceIt(
                  onPressed: () {
                    LauncherHelper.callPhone(phone: order.customerPhone);
                  },
                  child: Container(
                    width: 38.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCF8EE),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: const Color(0xFF9CE5C7)),
                    ),
                    child: Icon(
                      Icons.call_rounded,
                      color: const Color(0xFF1AAE77),
                      size: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}