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
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 10.h),
            child: Row(
              children: <Widget>[
                Container(
                  width: 42.w,
                  height: 42.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE9EFFA),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.directions_car_filled_outlined,
                    color: const Color(0xFF1F69D2),
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                AppText(
                  'Vehicle Info',
                  style: font18w700.copyWith(color: const Color(0xFF102B54)),
                ),
                const Spacer(),
                SizedBox(
                  width: 90.w,
                  child: BouncingSocialButton(
                    text: 'Edit',
                    onTap: () {},
                    color: Color(0xff0a7bcb),
                    borderColor: const Color(0x66FFFFFF),
                    textSize: 16.sp,
                    //  textWeight: FontWeight.w700,
                    radius: 26.r,
                    height: 38.h,
                    leading: Icon(
                      Icons.edit_outlined,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1.h, color: const Color(0xFFDDE4F1)),
          Padding(
            padding: EdgeInsets.fromLTRB(14.w, 14.h, 14.w, 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.zero,

                  leading: AppAsset(
                    assetName: Assets.motorcycle,
                    width: 36.w,
                    height: 36.h,
                  ),

                  title: AppText(
                    'CAR MODEL',
                    style: font16w700.copyWith(color: const Color(0xFFA0AEC2)),
                  ),

                  subtitle: AppText(
                    profile.vehicleModel,
                    style: font20w700.copyWith(color: const Color(0xFF102B54)),
                  ),
                ),

                SizedBox(height: 22.h),
                AppText(
                  'PLATE NUMBER',
                  style: font20w700.copyWith(color: const Color(0xFFA0AEC2)),
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
