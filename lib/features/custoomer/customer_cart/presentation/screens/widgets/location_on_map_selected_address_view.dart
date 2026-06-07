import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class LocationOnMapSelectedAddressView extends StatelessWidget {
  const LocationOnMapSelectedAddressView({super.key, required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFD9E2EC)),
      ),
      child: AppText(
        address,
        maxLines: 2,
        style: font14w500.copyWith(color: const Color(0xFF27445D)),
      ),
    );
  }
}
