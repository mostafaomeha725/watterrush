import '../../domain/entities/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  CustomerModel({required super.id, required super.name, required super.phone});

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}