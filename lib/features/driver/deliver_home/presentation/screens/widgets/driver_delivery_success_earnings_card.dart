import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class DriverDeliverySuccessEarningsCard extends StatelessWidget {
  const DriverDeliverySuccessEarningsCard({
    super.key,
    required this.orderAmount,
    required this.isCash,
  });

  final String orderAmount;
  final bool isCash;

  @override
  Widget build(BuildContext context) {
    final String title = isCash ? 'Cash Collected' : 'Payment Received';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFF22C08A)),
      ),
      child: Column(
        children: <Widget>[
          AppText(
            title,
            alignment: AlignmentDirectional.center,
            style: font18w500.copyWith(color: const Color(0xFF6E7F96)),
          ),
          SizedBox(height: 6.h),
          AppText(
            orderAmount,
            alignment: AlignmentDirectional.center,
            style: font24w800.copyWith(color: const Color(0xFF18B57B)),
          ),
        ],
      ),
    );
  }
}