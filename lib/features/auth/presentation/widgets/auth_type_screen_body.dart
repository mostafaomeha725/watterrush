import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_role_option_card.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_heading_section.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_logo_section.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_trust_bar.dart';

class AuthTypeScreenBody extends StatelessWidget {
  const AuthTypeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: AppAsset(assetName: Assets.background, fit: BoxFit.cover),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 46.h),
                const AuthTypeLogoSection(),
                SizedBox(height: 28.h),
                const AuthTypeHeadingSection(),
                SizedBox(height: 24.h),
                AuthRoleOptionCard(
                  title: "I'm a Customer",
                  subtitle: 'Order water delivery',
                  icon: Icons.person_outline_rounded,
                  onTap: () => context.push(Routes.customerLoginScreen),
                  backgroundColor: const Color(0xFFF1F5FC),
                  iconCircleColor: const Color(0xFF2E90FF),
                  iconColor: Colors.white,
                  titleColor: const Color(0xFF113A7A),
                  subtitleColor: const Color(0xFF5E7697),
                  trailingCircleColor: const Color(0xFFF8FBFF),
                  trailingIconColor: const Color(0xFF197FFF),
                  border: Border.all(
                    color: const Color(0xFFDDE7F5),
                    width: 1.w,
                  ),
                ),
                SizedBox(height: 16.h),
                AuthRoleOptionCard(
                  title: "I'm a Delivery Partner",
                  subtitle: 'Deliver orders',
                  icon: Icons.local_shipping_outlined,
                  onTap: () => context.push(Routes.driverLoginScreen),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0C48D9), Color(0xFF1FB3FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  iconCircleColor: const Color(0xFF2EA8FF),
                  iconColor: Colors.white,
                  titleColor: Colors.white,
                  subtitleColor: const Color(0xFFE4F2FF),
                  trailingCircleColor: const Color(0xFFF3F9FF),
                  trailingIconColor: const Color(0xFF137CFF),
                ),
                SizedBox(height: 32.h),
                const AuthTypeTrustBar(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
