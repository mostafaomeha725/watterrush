import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_login_back_button.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_login_continue_button.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_login_header_section.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_trust_bar.dart';
import 'package:waterrush/features/auth/presentation/widgets/customer_login_bottom_section.dart';
import 'package:waterrush/features/auth/presentation/widgets/driver_login_bottom_section.dart';
import 'package:waterrush/features/auth/presentation/widgets/phone_input_field.dart';

enum AuthLoginMode { customer, driver }

class AuthPhoneLoginScreenBody extends StatefulWidget {
  const AuthPhoneLoginScreenBody({
    required this.title,
    required this.subtitle,
    required this.phoneHint,
    required this.mode,
    this.showTerms = false,
    super.key,
  });

  final String title;
  final String subtitle;
  final String phoneHint;
  final AuthLoginMode mode;
  final bool showTerms;

  @override
  State<AuthPhoneLoginScreenBody> createState() =>
      _AuthPhoneLoginScreenBodyState();
}

class _AuthPhoneLoginScreenBodyState extends State<AuthPhoneLoginScreenBody> {
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        fit: StackFit.expand,
        children: [
          const AppAsset(assetName: Assets.background, fit: BoxFit.cover),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 4.h),
                  AuthLoginBackButton(onTap: () => context.pop()),
                  SizedBox(height: 26.h),
                  AuthLoginHeaderSection(
                    title: widget.title,
                    subtitle: widget.subtitle,
                  ),
                  SizedBox(height: 20.h),
                  PhoneInputField(
                    controller: _phoneController,
                    hint: widget.phoneHint,
                    countryFlag: widget.mode == AuthLoginMode.driver
                        ? '🇺🇸'
                        : '🇪🇬',
                    countryCode: widget.mode == AuthLoginMode.driver
                        ? '+1'
                        : '+20',
                  ),
                  SizedBox(height: 16.h),
                  AuthLoginContinueButton(
                    onPressed: () {
                      if (widget.mode == AuthLoginMode.customer) {
                        context.push(Routes.otpScreen);
                      } else {
                        context.go(Routes.mainNavigationScreen, extra: false);
                      }
                    },
                  ),
                  SizedBox(height: 18.h),
                  if (widget.mode == AuthLoginMode.customer)
                    const CustomerLoginBottomSection()
                  else
                    const DriverLoginBottomSection(),
                  SizedBox(height: 16.h),
                  AuthTypeTrustBar(
                    fastDeliverySubtitle: widget.mode == AuthLoginMode.driver
                        ? 'On Time'
                        : 'In Minutes',
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
