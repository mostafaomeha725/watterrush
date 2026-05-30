import 'package:equatable/equatable.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';

class DriverDeliveryDetailsState extends Equatable {
  const DriverDeliveryDetailsState({
    required this.order,
    required this.stage,
    required this.progressStage,
    this.selectedRejectReason,
    this.rejectedReason,
  });

  final DeliverOrderModel order;
  final DriverDeliveryStage stage;
  final DriverDeliveryStage progressStage;
  final String? selectedRejectReason;
  final String? rejectedReason;

  bool get isRejected => stage == DriverDeliveryStage.rejected;
  bool get isDelivered => stage == DriverDeliveryStage.delivered;
  bool get canReject => !isRejected && !isDelivered;

  DriverDeliveryDetailsState copyWith({
    DeliverOrderModel? order,
    DriverDeliveryStage? stage,
    DriverDeliveryStage? progressStage,
    String? selectedRejectReason,
    String? rejectedReason,
    bool clearSelectedRejectReason = false,
  }) {
    return DriverDeliveryDetailsState(
      order: order ?? this.order,
      stage: stage ?? this.stage,
      progressStage: progressStage ?? this.progressStage,
      selectedRejectReason: clearSelectedRejectReason
          ? null
          : (selectedRejectReason ?? this.selectedRejectReason),
      rejectedReason: rejectedReason ?? this.rejectedReason,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    order,
    stage,
    progressStage,
    selectedRejectReason,
    rejectedReason,
  ];
}