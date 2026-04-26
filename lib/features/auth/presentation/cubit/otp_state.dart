import 'package:equatable/equatable.dart';

enum OtpStatus { initial, loading, success, error }

class OtpState extends Equatable {
  const OtpState({
    required this.remainingSeconds,
    required this.digits,
    required this.canResend,
    required this.status,
    required this.message,
  });

  factory OtpState.initial() => const OtpState(
    remainingSeconds: 45,
    digits: ['', '', '', '', '', ''],
    canResend: false,
    status: OtpStatus.initial,
    message: '',
  );

  final int remainingSeconds;
  final List<String> digits;
  final bool canResend;
  final OtpStatus status;
  final String message;

  bool get isComplete => digits.every((digit) => digit.isNotEmpty);

  OtpState copyWith({
    int? remainingSeconds,
    List<String>? digits,
    bool? canResend,
    OtpStatus? status,
    String? message,
  }) {
    return OtpState(
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      digits: digits ?? this.digits,
      canResend: canResend ?? this.canResend,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
    remainingSeconds,
    digits,
    canResend,
    status,
    message,
  ];
}
