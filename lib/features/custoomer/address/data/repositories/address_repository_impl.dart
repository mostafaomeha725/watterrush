import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/repositories/address_repository.dart';
import '../../domain/usecases/create_address_usecase.dart';
import '../datasources/address_remote_data_source.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressRemoteDataSource remoteDataSource;

  AddressRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<AddressEntity>>> getAddresses() async {
    return await remoteDataSource.getAddresses();
  }

  @override
  Future<Either<Failure, AddressEntity>> createAddress(CreateAddressParams params) async {
    return await remoteDataSource.createAddress(params.toJson());
  }
}
