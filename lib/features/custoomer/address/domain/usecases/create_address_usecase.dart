import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/address_entity.dart';
import '../repositories/address_repository.dart';

class CreateAddressUseCase {
  final AddressRepository repository;

  CreateAddressUseCase(this.repository);

  Future<Either<Failure, AddressEntity>> call(CreateAddressParams params) {
    return repository.createAddress(params);
  }
}

class CreateAddressParams {
  final String title;
  final String address;
  final String lat;
  final String lng;
  final bool isDefault;

  CreateAddressParams({
    required this.title,
    required this.address,
    required this.lat,
    required this.lng,
    required this.isDefault,
  });

  Map<String, dynamic> toJson() => {
    "title": title,
    "address": address,
    "lat": lat,
    "lng": lng,
    "is_default": isDefault,
  };
}
