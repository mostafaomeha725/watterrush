import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/customer_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, CustomerEntity>> registerCustomer({
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    return await remoteDataSource.registerCustomer(
      name: name,
      phone: phone,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }

  @override
  Future<Either<Failure, CustomerEntity>> loginCustomer({
    required String phone,
    required String password,
  }) async {
    return await remoteDataSource.loginCustomer(
      phone: phone,
      password: password,
    );
  }

  @override
  Future<Either<Failure, void>> logoutCustomer() async {
    return await remoteDataSource.logoutCustomer();
  }

  @override
  Future<Either<Failure, CustomerEntity>> getCustomerProfile() async {
    return await remoteDataSource.getCustomerProfile();
  }

  @override
  Future<Either<Failure, CustomerEntity>> updateCustomerProfile({
    required String name,
  }) async {
    return await remoteDataSource.updateCustomerProfile(name: name);
  }
}
