import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/entities/order_entity.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/entities/scheduled_time_entity.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/usecases/place_order_usecase.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_remote_data_source.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    return await remoteDataSource.getCart();
  }

  @override
  Future<Either<Failure, void>> removeCartItem(int itemId) async {
    return await remoteDataSource.removeCartItem(itemId);
  }

  @override
  Future<Either<Failure, void>> clearCart() async {
    return await remoteDataSource.clearCart();
  }

  @override
  Future<Either<Failure, List<ScheduledTimeEntity>>> getScheduledTimes() async {
    return await remoteDataSource.getScheduledTimes();
  }

  @override
  Future<Either<Failure, OrderEntity>> placeOrder(PlaceOrderParams params) async {
    return await remoteDataSource.placeOrder(params);
  }
}
