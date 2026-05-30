import 'package:equatable/equatable.dart';

enum OtpStatus { initial, loading, success, error }

class OtpState extends Equatable {
  const OtpState({
    required this.remainingSeconds,
    required this.otpCode,
    required this.canResend,
    required this.status,
    required this.message,
  });

  factory OtpState.initial() => const OtpState(
    remainingSeconds: 45,
    otpCode: '',
    canResend: false,
    status: OtpStatus.initial,
    message: '',
  );

  final int remainingSeconds;
  final String otpCode;
  final bool canResend;
  final OtpStatus status;
  final String message;

  bool get isComplete => otpCode.length == 6;

  OtpState copyWith({
    int? remainingSeconds,
    String? otpCode,
    bool? canResend,
    OtpStatus? status,
    String? message,
  }) {
    return OtpState(
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      otpCode: otpCode ?? this.otpCode,
      canResend: canResend ?? this.canResend,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
    remainingSeconds,
    otpCode,
    canResend,
    status,
    message,
  ];
}