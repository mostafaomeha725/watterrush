import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_models.dart';

class DriverProfileHeaderIdentityRow extends StatelessWidget {
  const DriverProfileHeaderIdentityRow({super.key, required this.profile});

  final DriverProfileData profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              width: 104.w,
              height: 104.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0x88FFFFFF), width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(999.r),
                child: AppAsset(
                  assetName: profile.avatarAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: -2.w,
              bottom: -2.h,
              child: Container(
                width: 34.w,
                height: 34.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF1B90F0),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 16.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText(
                profile.name,
                style: font24w800.copyWith(color: Colors.white),
              ),
              SizedBox(height: 4.h),
              AppText(
                profile.phone,
                style: font16w500.copyWith(color: const Color(0xFFD8E8FF)),
              ),
              SizedBox(height: 5.h),
              Row(
                children: <Widget>[
                  ...List<Widget>.generate(
                    5,
                    (_) => Padding(
                      padding: EdgeInsetsDirectional.only(end: 3.w),
                      child: Icon(
                        Icons.star_rounded,
                        color: const Color(0xFFFFD64A),
                        size: 16.sp,
                      ),
                    ),
                  ),
                  AppText(
                    profile.rating,
                    style: font16w700.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
