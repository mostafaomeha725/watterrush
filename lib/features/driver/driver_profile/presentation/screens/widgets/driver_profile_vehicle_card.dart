import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/bouncing_social_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_models.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_plate_number_card.dart';

class DriverProfileVehicleCard extends StatelessWidget {
  const DriverProfileVehicleCard({super.key, required this.profile});

  final DriverProfileData profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF1464D8).withValues(alpha: 0.07),
            blurRadius: 16.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 14.h, 14.w, 12.h),
            child: Row(
              children: <Widget>[
                Container(
                  width: 42.w,
                  height: 42.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE4EEFF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.directions_car_filled_rounded,
                    color: const Color(0xFF1464D8),
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                AppText(
                  'Vehicle Info',
                  style: font18w700.copyWith(color: const Color(0xFF0B2650)),
                ),
                const Spacer(),
                SizedBox(
                  width: 88.w,
                  child: BouncingSocialButton(
                    text: 'Edit',
                    onTap: () {},
                    color: const Color(0xFF1464D8),
                    borderColor: const Color(0x00FFFFFF),
                    textSize: 14.sp,
                    radius: 26.r,
                    height: 38.h,
                    leading: Icon(
                      Icons.edit_outlined,
                      size: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1.h, color: const Color(0xFFF0F4FC)),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 18.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    AppAsset(
                      assetName: Assets.motorcycle,
                      width: 38.w,
                      height: 38.h,
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AppText(
                          'CAR MODEL',
                          style: font10w700.copyWith(
                            color: const Color(0xFF9BABC4),
                            letterSpacing: 1.0,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        AppText(
                          profile.vehicleModel,
                          style: font18w700.copyWith(
                            color: const Color(0xFF0B2650),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                AppText(
                  'PLATE NUMBER',
                  style: font10w700.copyWith(
                    color: const Color(0xFF9BABC4),
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 8.h),
                DriverProfilePlateNumberCard(plateNumber: profile.plateNumber),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
