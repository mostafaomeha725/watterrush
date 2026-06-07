import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/usecase/base_usecase.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/usecases/get_scheduled_times_usecase.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/usecases/place_order_usecase.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/checkout_cubit/checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final GetScheduledTimesUseCase getScheduledTimesUseCase;
  final PlaceOrderUseCase placeOrderUseCase;

  CheckoutCubit({
    required this.getScheduledTimesUseCase,
    required this.placeOrderUseCase,
  }) : super(const CheckoutState());

  Future<void> getScheduledTimes() async {
    emit(state.copyWith(scheduledTimesStatus: CheckoutStatus.loading));

    final result = await getScheduledTimesUseCase(NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          scheduledTimesStatus: CheckoutStatus.failure,
          scheduledTimesMessage: failure.message,
        ),
      ),
      (times) => emit(
        state.copyWith(
          scheduledTimesStatus: CheckoutStatus.success,
          scheduledTimes: times,
        ),
      ),
    );
  }

  Future<void> placeOrder(PlaceOrderParams params) async {
    emit(state.copyWith(placeOrderStatus: CheckoutStatus.loading));

    final result = await placeOrderUseCase(params);

    result.fold(
      (failure) => emit(
        state.copyWith(
          placeOrderStatus: CheckoutStatus.failure,
          placeOrderMessage: failure.message,
        ),
      ),
      (order) => emit(
        state.copyWith(
          placeOrderStatus: CheckoutStatus.success,
          placedOrder: order,
        ),
      ),
    );
  }
}
