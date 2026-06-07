import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/customer_entity.dart';
import '../repositories/auth_repository.dart';

class LoginCustomerUseCase {
  final AuthRepository repository;

  LoginCustomerUseCase(this.repository);

  Future<Either<Failure, CustomerEntity>> call({
    required String phone,
    required String password,
  }) async {
    return await repository.loginCustomer(phone: phone, password: password);
  }
}
