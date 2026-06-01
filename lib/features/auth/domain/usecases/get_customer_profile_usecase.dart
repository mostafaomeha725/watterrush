import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/customer_entity.dart';
import '../repositories/auth_repository.dart';

class GetCustomerProfileUseCase {
  final AuthRepository repository;

  GetCustomerProfileUseCase(this.repository);

  Future<Either<Failure, CustomerEntity>> call() async {
    return await repository.getCustomerProfile();
  }
}
