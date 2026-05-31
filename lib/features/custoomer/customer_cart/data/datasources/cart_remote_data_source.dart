import 'package:dartz/dartz.dart';
import 'package:waterrush/core/network/network_service.dart';
import 'package:waterrush/core/error/failure.dart';
import '../models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failure, CartModel>> getCart();
  Future<Either<Failure, void>> removeCartItem(int itemId);
  Future<Either<Failure, void>> clearCart();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final NetworkService networkService;

  CartRemoteDataSourceImpl({required this.networkService});

  @override
  Future<Either<Failure, CartModel>> getCart() async {
    final response = await networkService.getData(endPoint: 'customer/cart');

    return response.fold((failure) => Left(failure), (data) {
      if (data['status'] == true) {
        if (data['data']['cart'] != null) {
          return Right(CartModel.fromJson(data['data']['cart']));
        } else {
          return const Right(CartModel(id: 0, items: [], total: 0));
        }
      } else {
        return Left(
          ServerFailure(message: data['message'] ?? 'Failed to fetch cart'),
        );
      }
    });
  }

  @override
  Future<Either<Failure, void>> removeCartItem(int itemId) async {
    final response = await networkService.deleteData(
      endPoint: 'customer/cart/items/$itemId',
    );

    return response.fold((failureString) => Left(ServerFailure(message: failureString)), (data) {
      if (data['status'] == true) {
        return const Right(null);
      } else {
        return Left(
          ServerFailure(message: data['message'] ?? 'Failed to remove item'),
        );
      }
    });
  }

  @override
  Future<Either<Failure, void>> clearCart() async {
    final response = await networkService.deleteData(
      endPoint: 'customer/cart',
    );

    return response.fold((failureString) => Left(ServerFailure(message: failureString)), (data) {
      if (data['status'] == true) {
        return const Right(null);
      } else {
        return Left(
          ServerFailure(message: data['message'] ?? 'Failed to clear cart'),
        );
      }
    });
  }
}
