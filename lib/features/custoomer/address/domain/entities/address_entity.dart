import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final int id;
  final int customerId;
  final String title;
  final String address;
  final String lat;
  final String lng;
  final bool isDefault;
  final String createdAt;
  final String updatedAt;

  const AddressEntity({
    required this.id,
    required this.customerId,
    required this.title,
    required this.address,
    required this.lat,
    required this.lng,
    required this.isDefault,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        customerId,
        title,
        address,
        lat,
        lng,
        isDefault,
        createdAt,
        updatedAt,
      ];
}
