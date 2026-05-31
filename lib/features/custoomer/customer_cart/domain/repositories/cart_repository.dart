import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import '../entities/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, CartEntity>> getCart();
}
