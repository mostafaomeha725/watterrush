import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_orders_state.dart';

class CustomerOrdersCubit extends Cubit<CustomerOrdersState> {
  CustomerOrdersCubit() : super(const CustomerOrdersTabChanged(0));

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  void changeTab(int index) {
    if (_selectedTabIndex == index) return;
    _selectedTabIndex = index;
    emit(CustomerOrdersTabChanged(_selectedTabIndex));
  }
}
