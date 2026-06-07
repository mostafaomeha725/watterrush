import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/customer_entity.dart';
import '../repositories/auth_repository.dart';

class UpdateCustomerProfileUseCase {
  final AuthRepository repository;

  UpdateCustomerProfileUseCase(this.repository);

  Future<Either<Failure, CustomerEntity>> call({required String name}) async {
    return await repository.updateCustomerProfile(name: name);
  }
}
