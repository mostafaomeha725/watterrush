import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import '../repositories/cart_repository.dart';

class ClearCartUseCase {
  final CartRepository repository;

  ClearCartUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.clearCart();
  }
}
