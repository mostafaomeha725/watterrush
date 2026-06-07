import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/usecases/get_order_details_usecase.dart';
import 'customer_order_details_state.dart';

class CustomerOrderDetailsCubit extends Cubit<CustomerOrderDetailsState> {
  final GetOrderDetailsUseCase getOrderDetailsUseCase;

  CustomerOrderDetailsCubit({required this.getOrderDetailsUseCase})
    : super(CustomerOrderDetailsInitial());

  Future<void> getOrderDetails(int id) async {
    emit(GetOrderDetailsLoading());
    final result = await getOrderDetailsUseCase(id);
    result.fold(
      (failure) => emit(GetOrderDetailsFailure(failure.message)),
      (order) => emit(GetOrderDetailsSuccess(order)),
    );
  }
}
