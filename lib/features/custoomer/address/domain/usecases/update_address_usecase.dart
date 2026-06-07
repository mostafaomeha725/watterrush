import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/address_entity.dart';
import '../repositories/address_repository.dart';

class UpdateAddressUseCase {
  final AddressRepository repository;

  UpdateAddressUseCase(this.repository);

  Future<Either<Failure, AddressEntity>> call(
    UpdateAddressParams params,
  ) async {
    return await repository.updateAddress(params);
  }
}

class UpdateAddressParams {
  final int id;
  final String title;
  final String address;
  final double lat;
  final double lng;
  final bool isDefault;

  UpdateAddressParams({
    required this.id,
    required this.title,
    required this.address,
    required this.lat,
    required this.lng,
    required this.isDefault,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'address': address,
      'lat': lat,
      'lng': lng,
      'is_default': isDefault,
    };
  }
}
