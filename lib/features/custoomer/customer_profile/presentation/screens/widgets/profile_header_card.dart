import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_avatar_stack.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_top_curve_clipper.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.subtitle,
    required this.phone,
  });

  final String imageUrl;
  final String name;
  final String subtitle;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: const Color(0xFFDDE3EC)),
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 120.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF1E88E5),
                      Color(0xFF42A5F5),
                      Color(0xFF64B5F6),
                      Color(0xFF90CAF9),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.r),
                    topRight: Radius.circular(22.r),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.35,
                        child: const AppAsset(
                          assetName: Assets.wave,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: -5.h,
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: TopCurveClipper(),
                  child: Container(height: 80.h, color: Colors.white),
                ),
              ),

              Positioned(
                bottom: -10.h,
                left: 0,
                right: 0,
                child: Center(child: ProfileAvatarStack(imageUrl: imageUrl)),
              ),
            ],
          ),

          SizedBox(height: 26.h),

          AppText(
            name,
            style: font20w700.copyWith(color: const Color(0xFF2A4570)),
            alignment: AlignmentDirectional.center,
          ),

          SizedBox(height: 4.h),

          AppText(
            subtitle,
            style: font14w400.copyWith(color: const Color(0xFF6F8198)),
            alignment: AlignmentDirectional.center,
          ),

          SizedBox(height: 12.h),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F5FF),
              borderRadius: BorderRadius.circular(26.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.phone, size: 14.sp, color: Color(0xFF2E8CF5)),
                SizedBox(width: 6.w),
                AppText(
                  phone,
                  style: font14w500.copyWith(color: const Color(0xFF4C6280)),
                ),
              ],
            ),
          ),

          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}