import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import '../entities/cart_entity.dart';
import '../repositories/cart_repository.dart';

class GetCartUseCase {
  final CartRepository repository;

  GetCartUseCase(this.repository);

  Future<Either<Failure, CartEntity>> call() async {
    return await repository.getCart();
  }
}
