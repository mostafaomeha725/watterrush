import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/customer_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, CustomerEntity>> registerCustomer({
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
  });

  Future<Either<Failure, CustomerEntity>> loginCustomer({
    required String phone,
    required String password,
  });

  Future<Either<Failure, CustomerEntity>> getCustomerProfile();

  Future<Either<Failure, void>> logoutCustomer();
}
