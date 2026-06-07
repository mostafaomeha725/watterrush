import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import '../repositories/cart_repository.dart';

class UpdateCartItemUseCase {
  final CartRepository repository;

  UpdateCartItemUseCase(this.repository);

  Future<Either<Failure, void>> call(UpdateCartItemParams params) async {
    return await repository.updateCartItem(
      itemId: params.itemId,
      quantity: params.quantity,
    );
  }
}

class UpdateCartItemParams {
  final int itemId;
  final int quantity;

  UpdateCartItemParams({required this.itemId, required this.quantity});
}
