import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/address_entity.dart';

import '../usecases/create_address_usecase.dart';
import '../usecases/update_address_usecase.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<AddressEntity>>> getAddresses();
  Future<Either<Failure, AddressEntity>> createAddress(
    CreateAddressParams params,
  );
  Future<Either<Failure, AddressEntity>> updateAddress(
    UpdateAddressParams params,
  );
  Future<Either<Failure, AddressEntity>> setDefaultAddress(int id);
  Future<Either<Failure, void>> deleteAddress(int id);
}
