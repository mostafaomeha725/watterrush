import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/address_entity.dart';
import '../repositories/address_repository.dart';

class GetAddressesUseCase {
  final AddressRepository repository;

  GetAddressesUseCase(this.repository);

  Future<Either<Failure, List<AddressEntity>>> call() async {
    return await repository.getAddresses();
  }
}
