import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/address_entity.dart';

import '../usecases/create_address_usecase.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<AddressEntity>>> getAddresses();
  Future<Either<Failure, AddressEntity>> createAddress(CreateAddressParams params);
}
