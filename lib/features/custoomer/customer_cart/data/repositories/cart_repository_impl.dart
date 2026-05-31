import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
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
}
