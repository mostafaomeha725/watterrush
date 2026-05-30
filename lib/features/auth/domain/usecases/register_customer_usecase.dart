import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/customer_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class RegisterCustomerUseCase {
  final AuthRepository repository;

  RegisterCustomerUseCase(this.repository);

  Future<Either<Failure, CustomerEntity>> call({
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    return await repository.registerCustomer(
      name: name,
      phone: phone,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
