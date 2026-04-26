import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_models.dart';

class DriverProfileCashCard extends StatelessWidget {
  const DriverProfileCashCard({super.key, required this.profile});

  final DriverProfileData profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 14.h),
      decoration: BoxDecoration(
        color: const Color(0xffd7fae8),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: const Color(0xFF53D8A6)),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 46.w,
                height: 46.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFADEBD3),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.payments_outlined,
                  color: Color(0xFF08A66E),
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    'Cash on Delivery',
                    style: font18w500.copyWith(color: const Color(0xFF075E4F)),
                  ),
                  AppText(
                    'Collected - hand to supervisor',
                    style: font16w500.copyWith(color: const Color(0xFF52BFA4)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          AppText(
            profile.cashCollected,
            style: font32w900.copyWith(color: const Color(0xFF07986A)),
          ),
        ],
      ),
    );
  }
}
