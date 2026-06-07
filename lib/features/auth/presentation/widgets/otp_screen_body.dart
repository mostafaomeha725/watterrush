import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_snack_bar.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/auth/presentation/cubit/otp_cubit/otp_cubit.dart';
import 'package:waterrush/features/auth/presentation/cubit/otp_cubit/otp_state.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_login_back_button.dart';
import 'package:waterrush/features/auth/presentation/widgets/otp_change_phone_section.dart';
import 'package:waterrush/features/auth/presentation/widgets/otp_resend_section.dart';
import 'package:waterrush/features/auth/presentation/widgets/otp_verification_header.dart';
import 'package:waterrush/features/auth/presentation/widgets/pin_code_field.dart';

class OtpScreenBody extends StatelessWidget {
  const OtpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OtpCubit>(
      create: (_) => OtpCubit(),
      child: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state.status == OtpStatus.error && state.message.isNotEmpty) {
            CustomSnackBar.showError(context, message: state.message);
          }
          if (state.status == OtpStatus.success && state.message.isNotEmpty) {
            CustomSnackBar.showSuccess(context, message: state.message);
            context.go(Routes.mainNavigationScreen, extra: true);
          }
        },
        builder: (context, state) {
          final OtpCubit cubit = context.read<OtpCubit>();
          return SizedBox.expand(
            child: Stack(
              fit: StackFit.expand,
              children: [
                const AppAsset(assetName: Assets.background, fit: BoxFit.cover),
                SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        SizedBox(height: 8.h),
                        AuthLoginBackButton(onTap: () => context.pop()),
                        SizedBox(height: 18.h),
                        const OtpVerificationHeader(
                          phoneNumber: '+20 123 456 7890',
                        ),
                        SizedBox(height: 40.h),
                        PinCodeField(cubit: cubit),
                        SizedBox(height: 22.h),
                        OtpResendSection(
                          canResend: state.canResend,
                          remainingSeconds: state.remainingSeconds,
                          onResend: cubit.resendCode,
                        ),
                        SizedBox(height: 26.h),
                        AppButton(
                          text: 'Verify OTP',
                          onPressed: cubit.verifyOtp,
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFF0E4FE3), Color(0xFF35C5FF)],
                          ),
                          textSize: 20.sp,
                          textWeight: FontWeight.w700,
                          radius: 12.r,
                          height: 56.h,
                          borderColor: Colors.transparent,
                        ),
                        SizedBox(height: 28.h),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: const Color(0xFFDDE6F3),
                                thickness: 1.h,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: AppText(
                                'or',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFA4B6D1),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: const Color(0xFFDDE6F3),
                                thickness: 1.h,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        const OtpChangePhoneSection(),
                        SizedBox(height: 60.h),
                      ],
                    ),
                  ),
                ),
                if (state.status == OtpStatus.loading)
                  Positioned.fill(child: CustomLoading.showLoader()),
              ],
            ),
          );
        },
      ),
    );
  }
}
