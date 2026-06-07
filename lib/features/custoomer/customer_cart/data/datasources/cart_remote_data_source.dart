import 'package:dartz/dartz.dart';
import 'package:waterrush/core/network/network_service.dart';
import 'package:waterrush/core/network/endpoints.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_cart/data/models/order_model.dart';
import 'package:waterrush/features/custoomer/customer_cart/data/models/scheduled_time_model.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/usecases/place_order_usecase.dart';
import '../models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failure, CartModel>> getCart();
  Future<Either<Failure, void>> removeCartItem(int itemId);
  Future<Either<Failure, void>> clearCart();
  Future<Either<Failure, List<ScheduledTimeModel>>> getScheduledTimes();
  Future<Either<Failure, OrderModel>> placeOrder(PlaceOrderParams params);
  Future<Either<Failure, void>> addToCart({
    required int productId,
    required int quantity,
  });
  Future<Either<Failure, void>> updateCartItem({
    required int itemId,
    required int quantity,
  });
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final NetworkService networkService;

  CartRemoteDataSourceImpl({required this.networkService});

  @override
  Future<Either<Failure, CartModel>> getCart() async {
    final response = await networkService.getData(
      endPoint: EndPoints.customerCart,
    );

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
      endPoint: '${EndPoints.customerCartItems}/$itemId',
    );

    return response.fold(
      (failureString) => Left(ServerFailure(message: failureString)),
      (data) {
        if (data['status'] == true) {
          return const Right(null);
        } else {
          return Left(
            ServerFailure(message: data['message'] ?? 'Failed to remove item'),
          );
        }
      },
    );
  }

  @override
  Future<Either<Failure, void>> clearCart() async {
    final response = await networkService.deleteData(
      endPoint: EndPoints.customerCart,
    );

    return response.fold(
      (failureString) => Left(ServerFailure(message: failureString)),
      (data) {
        if (data['status'] == true) {
          return const Right(null);
        } else {
          return Left(
            ServerFailure(message: data['message'] ?? 'Failed to clear cart'),
          );
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<ScheduledTimeModel>>> getScheduledTimes() async {
    final response = await networkService.getData(
      endPoint: EndPoints.customerScheduledTimes,
    );

    return response.fold((failure) => Left(failure), (data) {
      if (data['status'] == true) {
        final List scheduledTimesList = data['data']['scheduled_times'] ?? [];
        final List<ScheduledTimeModel> scheduledTimes = scheduledTimesList
            .map((item) => ScheduledTimeModel.fromJson(item))
            .toList();
        return Right(scheduledTimes);
      } else {
        return Left(
          ServerFailure(
            message: data['message'] ?? 'Failed to fetch scheduled times',
          ),
        );
      }
    });
  }

  @override
  Future<Either<Failure, OrderModel>> placeOrder(
    PlaceOrderParams params,
  ) async {
    final response = await networkService.postData(
      endPoint: EndPoints.customerOrders,
      data: params.toJson(),
    );

    return response.fold((failure) => Left(failure), (data) {
      if (data['status'] == true) {
        return Right(OrderModel.fromJson(data['data']['order']));
      } else {
        return Left(
          ServerFailure(message: data['message'] ?? 'Failed to place order'),
        );
      }
    });
  }

  @override
  Future<Either<Failure, void>> addToCart({
    required int productId,
    required int quantity,
  }) async {
    final response = await networkService.postData(
      endPoint: EndPoints.customerCartItems,
      data: {'product_id': productId, 'quantity': quantity},
    );

    return response.fold((failure) => Left(failure), (data) {
      if (data['status'] == true) {
        return const Right(null);
      } else {
        return Left(
          ServerFailure(
            message: data['message'] ?? 'Failed to add item to cart',
          ),
        );
      }
    });
  }

  @override
  Future<Either<Failure, void>> updateCartItem({
    required int itemId,
    required int quantity,
  }) async {
    final response = await networkService.patchData(
      endPoint: '${EndPoints.customerCartItems}/$itemId',
      data: {'quantity': quantity},
    );

    return response.fold(
      (failureString) => Left(ServerFailure(message: failureString)),
      (data) {
        if (data['status'] == true) {
          return const Right(null);
        } else {
          return Left(
            ServerFailure(
              message: data['message'] ?? 'Failed to update item in cart',
            ),
          );
        }
      },
    );
  }
}
