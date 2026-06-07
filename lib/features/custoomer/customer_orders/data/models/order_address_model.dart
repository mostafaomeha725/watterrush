import 'package:waterrush/features/custoomer/customer_orders/domain/entities/order_address_entity.dart';

class OrderAddressModel extends OrderAddressEntity {
  const OrderAddressModel({
    required super.id,
    required super.title,
    required super.address,
    required super.lat,
    required super.lng,
  });

  factory OrderAddressModel.fromJson(Map<String, dynamic> json) {
    return OrderAddressModel(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id'].toString()) ?? 0,
      title: json['title'] ?? '',
      address: json['address'] ?? '',
      lat: json['lat'] ?? '',
      lng: json['lng'] ?? '',
    );
  }
}
