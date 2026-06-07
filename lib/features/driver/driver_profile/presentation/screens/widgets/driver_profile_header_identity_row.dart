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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              width: 96.w,
              height: 96.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0x99FFFFFF), width: 2.5),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: const Color(0xFF000000).withValues(alpha: 0.18),
                    blurRadius: 14.r,
                    offset: const Offset(0, 6),
                  ),
                ],
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
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: <Color>[Color(0xFF18DDA7), Color(0xFF0CB87A)],
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Icon(
                  Icons.verified_rounded,
                  color: Colors.white,
                  size: 14.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText(
                profile.name,
                style: font22w700.copyWith(
                  color: Colors.white,
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.phone_rounded,
                    size: 13.sp,
                    color: const Color(0xFFADCAFF),
                  ),
                  SizedBox(width: 5.w),
                  AppText(
                    profile.phone,
                    style: font14w500.copyWith(color: const Color(0xFFCCDFFF)),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: <Widget>[
                  ...List<Widget>.generate(
                    5,
                    (_) => Padding(
                      padding: EdgeInsetsDirectional.only(end: 2.w),
                      child: Icon(
                        Icons.star_rounded,
                        color: const Color(0xFFFFD64A),
                        size: 15.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  AppText(
                    profile.rating,
                    style: font14w700.copyWith(color: Colors.white),
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
