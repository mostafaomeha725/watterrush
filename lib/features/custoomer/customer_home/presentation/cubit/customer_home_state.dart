import 'package:equatable/equatable.dart';

enum CustomerHomeStatus { initial, loading, success }

class CustomerHomeState extends Equatable {
  const CustomerHomeState({
    required this.currentBannerIndex,
    required this.status,
    required this.message,
  });

  factory CustomerHomeState.initial() => const CustomerHomeState(
    currentBannerIndex: 0,
    status: CustomerHomeStatus.initial,
    message: '',
  );

  final int currentBannerIndex;
  final CustomerHomeStatus status;
  final String message;

  CustomerHomeState copyWith({
    int? currentBannerIndex,
    CustomerHomeStatus? status,
    String? message,
  }) {
    return CustomerHomeState(
      currentBannerIndex: currentBannerIndex ?? this.currentBannerIndex,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [currentBannerIndex, status, message];
}
