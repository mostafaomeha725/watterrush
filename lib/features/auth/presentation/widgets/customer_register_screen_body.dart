import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/app_form_field.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_login_back_button.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_login_continue_button.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_login_header_section.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_trust_bar.dart';
import 'package:waterrush/features/auth/presentation/widgets/phone_input_field.dart';

class CustomerRegisterScreenBody extends StatefulWidget {
  const CustomerRegisterScreenBody({super.key});

  @override
  State<CustomerRegisterScreenBody> createState() =>
      _CustomerRegisterScreenBodyState();
}

class _CustomerRegisterScreenBodyState
    extends State<CustomerRegisterScreenBody> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmationController;

  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmationController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
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
                  const AuthLoginHeaderSection(
                    title: 'Create Account',
                    subtitle: 'Sign up to get started',
                  ),
                  SizedBox(height: 20.h),
                  AppFormField(
                    controller: _nameController,
                    hintText: 'Full Name',
                    radius: 18.r,
                    fillColor: AppLightColors.white,
                    borderColor: const Color(0xFFDCE4F1),
                    focusedBorderColor: AppLightColors.buttonColor,
                    borderWidth: 1.w,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Icon(
                        Icons.person_outline,
                        size: 21.sp,
                        color: const Color(0xFF6D7F99),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  PhoneInputField(
                    controller: _phoneController,
                    hint: '501 234 567',
                  ),
                  SizedBox(height: 16.h),
                  AppFormField(
                    controller: _passwordController,
                    hintText: 'Password',
                    obsecureText: _isPasswordObscured,
                    maxLines: 1,
                    radius: 18.r,
                    fillColor: AppLightColors.white,
                    borderColor: const Color(0xFFDCE4F1),
                    focusedBorderColor: AppLightColors.buttonColor,
                    borderWidth: 1.w,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Icon(
                        Icons.lock_outline,
                        size: 21.sp,
                        color: const Color(0xFF6D7F99),
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () => setState(
                        () => _isPasswordObscured = !_isPasswordObscured,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Icon(
                          _isPasswordObscured
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 21.sp,
                          color: const Color(0xFF6D7F99),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AppFormField(
                    controller: _passwordConfirmationController,
                    hintText: 'Confirm Password',
                    obsecureText: _isConfirmPasswordObscured,
                    maxLines: 1,
                    radius: 18.r,
                    fillColor: AppLightColors.white,
                    borderColor: const Color(0xFFDCE4F1),
                    focusedBorderColor: AppLightColors.buttonColor,
                    borderWidth: 1.w,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Icon(
                        Icons.lock_outline,
                        size: 21.sp,
                        color: const Color(0xFF6D7F99),
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () => setState(
                        () => _isConfirmPasswordObscured =
                            !_isConfirmPasswordObscured,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Icon(
                          _isConfirmPasswordObscured
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 21.sp,
                          color: const Color(0xFF6D7F99),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  AuthLoginContinueButton(
                    onPressed: () {
                      context.push(Routes.otpScreen);
                    },
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText('Already have an account? '),
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: AppText(
                          'Login',
                          style: TextStyle(
                            color: AppLightColors.buttonColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 48.h),
                  const AuthTypeTrustBar(fastDeliverySubtitle: 'In Minutes'),
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
