import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/usecases/get_orders_usecase.dart';
import 'customer_orders_state.dart';

class CustomerOrdersCubit extends Cubit<CustomerOrdersState> {
  final GetOrdersUseCase getOrdersUseCase;

  CustomerOrdersCubit({required this.getOrdersUseCase})
    : super(const CustomerOrdersTabChanged(0));

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  List<CustomerOrderEntity> orders = [];

  void changeTab(int index) {
    if (_selectedTabIndex == index) return;
    _selectedTabIndex = index;
    emit(CustomerOrdersTabChanged(_selectedTabIndex));
    getOrders();
  }

  Future<void> getOrders() async {
    emit(GetOrdersLoading());
    final result = await getOrdersUseCase.call();
    result.fold((failure) => emit(GetOrdersFailure(failure.message)), (data) {
      orders = data;
      emit(GetOrdersSuccess(orders));
    });
  }
}
