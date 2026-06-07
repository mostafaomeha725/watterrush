import 'package:equatable/equatable.dart';

class OrderAddressEntity extends Equatable {
  final int id;
  final String title;
  final String address;
  final String lat;
  final String lng;

  const OrderAddressEntity({
    required this.id,
    required this.title,
    required this.address,
    required this.lat,
    required this.lng,
  });

  @override
  List<Object?> get props => [id, title, address, lat, lng];
}
