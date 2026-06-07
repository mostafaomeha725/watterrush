import 'package:equatable/equatable.dart';

enum OrderStatus { pending, inProgress, onTheWay, delivered, cancelled }

OrderStatus getOrderStatusFromString(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return OrderStatus.pending;
    case 'in_progress':
      return OrderStatus.inProgress;
    case 'on_the_way':
      return OrderStatus.onTheWay;
    case 'delivered':
      return OrderStatus.delivered;
    case 'cancelled':
      return OrderStatus.cancelled;
    default:
      return OrderStatus.pending;
  }
}

class CustomerOrderEntity extends Equatable {
  final int id;
  final OrderStatus status;
  final double total;
  final String deliveryDate;
  final String paymentMethod;
  final String createdAt;

  const CustomerOrderEntity({
    required this.id,
    required this.status,
    required this.total,
    required this.deliveryDate,
    required this.paymentMethod,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    status,
    total,
    deliveryDate,
    paymentMethod,
    createdAt,
  ];
}
