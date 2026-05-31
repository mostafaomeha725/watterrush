import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import '../repositories/cart_repository.dart';

class RemoveCartItemUseCase {
  final CartRepository repository;

  RemoveCartItemUseCase(this.repository);

  Future<Either<Failure, void>> call(int itemId) async {
    return await repository.removeCartItem(itemId);
  }
}
