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
    getOrders(page: 1);
  }

  String? get _currentStatus {
    switch (_selectedTabIndex) {
      case 1:
        return 'pending';
      case 2:
        return 'confirmed';
      case 3:
        return 'preparing';
      case 4:
        return 'on_the_way';
      case 5:
        return 'delivered';
      case 6:
        return 'cancelled';
      default:
        return null;
    }
  }

  List<CustomerOrderEntity> get filteredOrders {
    if (_selectedTabIndex == 0) return orders;
    final statusString = _currentStatus;
    if (statusString == null) return orders;
    
    // Fallback: local filtering just in case API doesn't filter
    return orders.where((order) {
      switch (statusString) {
        case 'pending': return order.status == OrderStatus.pending;
        case 'preparing': return order.status == OrderStatus.preparing;
        case 'confirmed': return order.status == OrderStatus.confirmed;
        case 'on_the_way': return order.status == OrderStatus.onTheWay;
        case 'delivered': return order.status == OrderStatus.delivered;
        case 'cancelled': return order.status == OrderStatus.cancelled;
        default: return true;
      }
    }).toList();
  }

  Future<void> getOrders({int page = 1}) async {
    emit(GetOrdersLoading());
    final result = await getOrdersUseCase.call(page: page, status: _currentStatus);
    result.fold((failure) => emit(GetOrdersFailure(failure.message)), (paginatedData) {
      if (page == 1) {
        orders = paginatedData.data;
      } else {
        orders.addAll(paginatedData.data);
      }
      currentPage = paginatedData.currentPage;
      lastPage = paginatedData.lastPage;
      emit(GetOrdersSuccess(orders));
    });
  }
}
