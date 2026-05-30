import 'package:equatable/equatable.dart';
import '../../domain/entities/slider_entity.dart';

enum CustomerHomeStatus { initial, loading, success }

class CustomerHomeState extends Equatable {
  const CustomerHomeState({
    required this.currentBannerIndex,
    required this.status,
    required this.message,
    required this.sliders,
    required this.slidersStatus,
  });

  factory CustomerHomeState.initial() => const CustomerHomeState(
    currentBannerIndex: 0,
    status: CustomerHomeStatus.initial,
    message: '',
    sliders: [],
    slidersStatus: CustomerHomeStatus.initial,
  );

  final int currentBannerIndex;
  final CustomerHomeStatus status;
  final String message;
  final List<SliderEntity> sliders;
  final CustomerHomeStatus slidersStatus;

  CustomerHomeState copyWith({
    int? currentBannerIndex,
    CustomerHomeStatus? status,
    String? message,
    List<SliderEntity>? sliders,
    CustomerHomeStatus? slidersStatus,
  }) {
    return CustomerHomeState(
      currentBannerIndex: currentBannerIndex ?? this.currentBannerIndex,
      status: status ?? this.status,
      message: message ?? this.message,
      sliders: sliders ?? this.sliders,
      slidersStatus: slidersStatus ?? this.slidersStatus,
    );
  }

  @override
  List<Object?> get props => [
        currentBannerIndex,
        status,
        message,
        sliders,
        slidersStatus,
      ];
}
