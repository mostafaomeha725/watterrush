import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../repositories/address_repository.dart';

class DeleteAddressUseCase {
  final AddressRepository repository;

  DeleteAddressUseCase(this.repository);

  Future<Either<Failure, void>> call(int id) async {
    return await repository.deleteAddress(id);
  }
}
