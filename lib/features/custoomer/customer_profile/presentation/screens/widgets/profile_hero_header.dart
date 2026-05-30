import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_avatar_stack.dart';

class ProfileHeroHeader extends StatelessWidget {
  const ProfileHeroHeader({
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
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: 180.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                ),
              ),
              child: ClipRect(
                child: AppAsset(
                  assetName: Assets.profileBackground,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: -25.h,
              left: 0,
              right: 0,
              child: Center(child: ProfileAvatarStack(imageUrl: imageUrl)),
            ),
          ],
        ),
        SizedBox(height: 42.h),
        AppText(
          name,
          style: font20w700.copyWith(color: const Color(0xFF0F2B46)),
          alignment: AlignmentDirectional.center,
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              subtitle,
              style: font14w400.copyWith(color: const Color(0xFF6B7E92)),
            ),
            SizedBox(width: 4.w),
            Text('💧', style: TextStyle(fontSize: 14.sp)),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF4FF),
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(color: const Color(0xFFD0DDF5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.phone_rounded,
                size: 14.sp,
                color: const Color(0xFF2E8CF5),
              ),
              SizedBox(width: 6.w),
              AppText(
                phone,
                style: font14w500.copyWith(color: const Color(0xFF3A5070)),
              ),
            ],
          ),
        ),
        SizedBox(height: 6.h),
      ],
    );
  }
}