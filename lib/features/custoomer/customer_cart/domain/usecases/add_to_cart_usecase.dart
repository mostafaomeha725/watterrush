import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/repositories/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<Either<Failure, void>> call(AddToCartParams params) {
    return repository.addToCart(params);
  }
}

class AddToCartParams {
  final int productId;
  final int quantity;

  AddToCartParams({required this.productId, required this.quantity});
}
