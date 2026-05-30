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
}
