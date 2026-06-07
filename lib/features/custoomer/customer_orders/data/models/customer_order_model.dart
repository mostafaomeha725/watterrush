import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';

class CustomerOrderModel extends CustomerOrderEntity {
  const CustomerOrderModel({
    required super.id,
    required super.status,
    required super.total,
    required super.deliveryDate,
    required super.paymentMethod,
    required super.createdAt,
  });

  factory CustomerOrderModel.fromJson(Map<String, dynamic> json) {
    return CustomerOrderModel(
      id: json['id'] as int? ?? 0,
      status: getOrderStatusFromString(json['status'] ?? ''),
      total: double.tryParse(json['total']?.toString() ?? '0') ?? 0.0,
      deliveryDate: json['delivery_date'] ?? '',
      paymentMethod: json['payment_method'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
