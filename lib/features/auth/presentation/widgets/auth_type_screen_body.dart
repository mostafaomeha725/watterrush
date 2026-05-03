import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_heading_section.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_interactive_card.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_logo_section.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_trust_bar.dart';

class AuthTypeScreenBody extends StatelessWidget {
  const AuthTypeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Positioned.fill(
          child: AppAsset(assetName: Assets.background, fit: BoxFit.cover),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: <Widget>[
                SizedBox(height: 46.h),
                const AuthTypeLogoSection(),
                SizedBox(height: 28.h),
                const AuthTypeHeadingSection(),
                SizedBox(height: 24.h),
                const AuthTypeInteractiveCard(
                  title: "I'm a Customer",
                  subtitle: 'Order water delivery',
                  icon: Icons.person_outline_rounded,
                  route: Routes.customerLoginScreen,
                ),
                SizedBox(height: 16.h),
                const AuthTypeInteractiveCard(
                  title: "I'm a Delivery Partner",
                  subtitle: 'Deliver orders',
                  icon: Icons.local_shipping_outlined,
                  route: Routes.driverLoginScreen,
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
