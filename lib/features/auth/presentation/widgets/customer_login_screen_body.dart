import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/app_form_field.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/core/utils/easy_loading.dart';
import 'package:waterrush/features/auth/presentation/cubit/customer_login_cubit.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_login_back_button.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_login_continue_button.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_login_header_section.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_trust_bar.dart';
import 'package:waterrush/features/auth/presentation/widgets/customer_login_bottom_section.dart';
import 'package:waterrush/features/auth/presentation/widgets/phone_input_field.dart';
import 'package:waterrush/core/theme/styles.dart';

class CustomerLoginScreenBody extends StatefulWidget {
  const CustomerLoginScreenBody({super.key});

  @override
  State<CustomerLoginScreenBody> createState() =>
      _CustomerLoginScreenBodyState();
}

class _CustomerLoginScreenBodyState extends State<CustomerLoginScreenBody> {
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;

  bool _isPasswordObscured = true;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerLoginCubit, CustomerLoginState>(
      listener: (context, state) {
        if (state is CustomerLoginLoading) {
          showLoading();
        } else if (state is CustomerLoginSuccess) {
          showSuccess('Login successful!');
          Future.delayed(const Duration(milliseconds: 1500), () {
            context.go(Routes.mainNavigationScreen, extra: true);
          });
        } else if (state is CustomerLoginFailure) {
          showError(state.errorMessage);
        } else {
          hideLoading();
        }
      },
      builder: (context, state) {
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
                        title: 'Welcome Back',
                        subtitle: 'Enter your phone number to continue',
                      ),
                      SizedBox(height: 20.h),
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
                      SizedBox(height: 24.h),
                      AuthLoginContinueButton(
                        onPressed: () {
                          context.read<CustomerLoginCubit>().login(
                            phone: _phoneController.text.trim(),
                            password: _passwordController.text,
                          );
                        },
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppText('Don\'t have an account? '),
                          GestureDetector(
                            onTap: () => context.push(Routes.registerScreen),
                            child: AppText(
                              'Register',
                              style: font16w700.copyWith(
                                color: const Color(0xFF113FC2),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18.h),
                      const CustomerLoginBottomSection(),
                      SizedBox(height: 48.h),
                      const AuthTypeTrustBar(
                        fastDeliverySubtitle: 'In Minutes',
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
