import 'package:equatable/equatable.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';

abstract class CustomerOrderDetailsState extends Equatable {
  const CustomerOrderDetailsState();

  @override
  List<Object?> get props => [];
}

class CustomerOrderDetailsInitial extends CustomerOrderDetailsState {}

class GetOrderDetailsLoading extends CustomerOrderDetailsState {}

class GetOrderDetailsSuccess extends CustomerOrderDetailsState {
  final CustomerOrderEntity order;

  const GetOrderDetailsSuccess(this.order);

  @override
  List<Object?> get props => [order];
}

class GetOrderDetailsFailure extends CustomerOrderDetailsState {
  final String message;

  const GetOrderDetailsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
