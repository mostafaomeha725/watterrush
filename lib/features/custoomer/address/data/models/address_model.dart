import '../../domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    required super.id,
    required super.customerId,
    required super.title,
    required super.address,
    required super.lat,
    required super.lng,
    required super.isDefault,
    required super.createdAt,
    required super.updatedAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] ?? 0,
      customerId: json['customer_id'] ?? 0,
      title: json['title'] ?? '',
      address: json['address'] ?? '',
      lat: json['lat'] ?? '',
      lng: json['lng'] ?? '',
      isDefault: json['is_default'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer_id': customerId,
      'title': title,
      'address': address,
      'lat': lat,
      'lng': lng,
      'is_default': isDefault,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
