import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_header_card.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_models.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_stats_grid.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_cash_card.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_vehicle_card.dart';
import 'package:waterrush/core/widgets/bouncing_social_button.dart';

class DriverProfileBody extends StatelessWidget {
  const DriverProfileBody({super.key});

  final DriverProfileData profile = DriverProfileDemoData.profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF0F4FD),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DriverProfileHeaderCard(profile: profile),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 12.h),
              child: Column(
                children: <Widget>[
                  DriverProfileStatsGrid(profile: profile),
                  SizedBox(height: 14.h),
                  DriverProfileCashCard(profile: profile),
                  SizedBox(height: 14.h),
                  DriverProfileVehicleCard(profile: profile),
                  SizedBox(height: 16.h),
                  BouncingSocialButton(
                    text: 'Logout',
                    onTap: () {},
                    textColor: const Color(0xFFD93030),
                    color: const Color(0xFFFFF0F0),
                    radius: 20.r,
                    height: 54.h,
                    textSize: 16.sp,
                    borderColor: const Color(0x55D93030),
                    leading: Icon(
                      Icons.logout_rounded,
                      size: 18.sp,
                      color: const Color(0xFFD93030),
                    ),
                  ),
                  SizedBox(height: 108.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}