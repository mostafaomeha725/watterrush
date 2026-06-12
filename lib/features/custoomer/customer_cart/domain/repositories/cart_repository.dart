import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/entities/order_entity.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/entities/scheduled_time_entity.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/usecases/place_order_usecase.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/usecases/add_to_cart_usecase.dart';
import '../entities/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, void>> removeCartItem(int itemId);
  Future<Either<Failure, void>> clearCart();
  Future<Either<Failure, List<ScheduledTimeEntity>>> getScheduledTimes();
  Future<Either<Failure, OrderEntity>> placeOrder(PlaceOrderParams params);
  Future<Either<Failure, void>> addToCart(AddToCartParams params);
  Future<Either<Failure, void>> updateCartItem({
    required int itemId,
    required int quantity,
  });
  Future<Either<Failure, double>> applyPromoCode(String code);
}
