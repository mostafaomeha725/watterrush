import 'package:equatable/equatable.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';

abstract class CustomerOrdersState extends Equatable {
  const CustomerOrdersState();

  @override
  List<Object?> get props => [];
}

class CustomerOrdersInitial extends CustomerOrdersState {}

class CustomerOrdersTabChanged extends CustomerOrdersState {
  final int selectedTabIndex;

  const CustomerOrdersTabChanged(this.selectedTabIndex);

  @override
  List<Object?> get props => [selectedTabIndex];
}

class GetOrdersLoading extends CustomerOrdersState {}

class GetOrdersSuccess extends CustomerOrdersState {
  final List<CustomerOrderEntity> orders;

  const GetOrdersSuccess(this.orders);

  @override
  List<Object?> get props => [orders];
}

class GetOrdersFailure extends CustomerOrdersState {
  final String message;

  const GetOrdersFailure(this.message);

  @override
  List<Object?> get props => [message];
}
