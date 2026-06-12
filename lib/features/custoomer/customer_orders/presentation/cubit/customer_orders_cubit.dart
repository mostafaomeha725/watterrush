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
  int currentPage = 1;
  int lastPage = 1;

  void changeTab(int index) {
    if (_selectedTabIndex == index) return;
    _selectedTabIndex = index;
    emit(CustomerOrdersTabChanged(_selectedTabIndex));
    getOrders();
  }

  Future<void> getOrders({int page = 1}) async {
    emit(GetOrdersLoading());
    final result = await getOrdersUseCase.call(page: page);
    result.fold((failure) => emit(GetOrdersFailure(failure.message)), (paginatedData) {
      orders = paginatedData.data;
      currentPage = paginatedData.currentPage;
      lastPage = paginatedData.lastPage;
      emit(GetOrdersSuccess(orders));
    });
  }
}
