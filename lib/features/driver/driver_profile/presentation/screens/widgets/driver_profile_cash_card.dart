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
      padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 18.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Color(0xFF0CB87A), Color(0xFF069A64)],
        ),
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF0CB87A).withValues(alpha: 0.30),
            blurRadius: 18.r,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 44.w,
                height: 44.w,
                decoration: const BoxDecoration(
                  color: Color(0x25FFFFFF),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.payments_rounded,
                  color: const Color(0xFFE8FFF6),
                  size: 22.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    'Cash on Delivery',
                    style: font16w700.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 2.h),
                  AppText(
                    'Collected — hand to supervisor',
                    style: font12w500.copyWith(
                      color: const Color(0xFFCCF7E8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            height: 1.h,
            color: const Color(0x30FFFFFF),
          ),
          SizedBox(height: 14.h),
          AppText(
            profile.cashCollected,
            style: font30w700.copyWith(
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 2.h),
          AppText(
            'Total cash collected today',
            style: font12w500.copyWith(color: const Color(0xFFCCF7E8)),
          ),
        ],
      ),
    );
  }
}
