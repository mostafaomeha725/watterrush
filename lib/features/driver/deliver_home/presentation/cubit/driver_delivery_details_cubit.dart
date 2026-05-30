import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/cubit/driver_delivery_details_state.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';

class DriverDeliveryDetailsCubit extends Cubit<DriverDeliveryDetailsState> {
  DriverDeliveryDetailsCubit({required DeliverOrderModel order})
    : super(
        DriverDeliveryDetailsState(
          order: order,
          stage: DriverDeliveryStage.accepted,
          progressStage: DriverDeliveryStage.accepted,
        ),
      );

  void moveToNextStage() {
    switch (state.stage) {
      case DriverDeliveryStage.accepted:
        emit(
          state.copyWith(
            stage: DriverDeliveryStage.pickedUp,
            progressStage: DriverDeliveryStage.pickedUp,
          ),
        );
        break;
      case DriverDeliveryStage.pickedUp:
        emit(
          state.copyWith(
            stage: DriverDeliveryStage.onTheWay,
            progressStage: DriverDeliveryStage.onTheWay,
          ),
        );
        break;
      case DriverDeliveryStage.onTheWay:
        emit(
          state.copyWith(
            stage: DriverDeliveryStage.delivered,
            progressStage: DriverDeliveryStage.delivered,
          ),
        );
        break;
      case DriverDeliveryStage.delivered:
      case DriverDeliveryStage.rejected:
        break;
    }
  }

  void resetRejectSelection() {
    emit(state.copyWith(clearSelectedRejectReason: true));
  }

  void selectRejectReason(String reason) {
    emit(state.copyWith(selectedRejectReason: reason));
  }

  void confirmReject() {
    final String? reason = state.selectedRejectReason;
    if (reason == null || reason.trim().isEmpty) {
      return;
    }

    emit(
      state.copyWith(
        stage: DriverDeliveryStage.rejected,
        rejectedReason: reason,
        clearSelectedRejectReason: true,
      ),
    );
  }
}