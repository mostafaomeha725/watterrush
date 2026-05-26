import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/helpers/helpers.dart';

import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpState.initial()) {
    startTimer();
  }

  final TextEditingController otpController = TextEditingController();

  Timer? timer;

  void startTimer({int seconds = 45}) {
    Helpers.cancelTimer(timer);
    emit(state.copyWith(remainingSeconds: seconds, canResend: seconds == 0));
    timer = Helpers.startCountdownTimer(
      initialSeconds: seconds,
      onTick: (value) {
        emit(state.copyWith(remainingSeconds: value, canResend: value == 0));
      },
    );
  }

  void onOtpChanged(String value) {
    emit(
      state.copyWith(otpCode: value, status: OtpStatus.initial, message: ''),
    );
  }

  void resendCode() {
    if (!state.canResend) return;
    otpController.clear();
    emit(state.copyWith(otpCode: '', status: OtpStatus.initial, message: ''));
    startTimer(seconds: 45);
  }

  Future<void> verifyOtp() async {
    if (!state.isComplete) {
      emit(
        state.copyWith(
          status: OtpStatus.error,
          message: 'Please enter the 6-digit code',
        ),
      );
      return;
    }
    emit(state.copyWith(status: OtpStatus.loading, message: ''));
    await Future<void>.delayed(const Duration(milliseconds: 900));
    emit(
      state.copyWith(
        status: OtpStatus.success,
        message: 'OTP verified successfully',
      ),
    );
  }

  @override
  Future<void> close() {
    Helpers.cancelTimer(timer);
    otpController.dispose();
    return super.close();
  }
}
