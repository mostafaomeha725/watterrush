import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/core/network/endpoints.dart';
import 'package:waterrush/core/network/network_service.dart';
import 'package:waterrush/features/custoomer/customer_orders/data/models/customer_order_model.dart';

import 'package:waterrush/core/models/paginated_data.dart';

abstract class OrdersRemoteDataSource {
  Future<Either<Failure, PaginatedData<CustomerOrderModel>>> getOrders({int page = 1});
  Future<Either<Failure, CustomerOrderModel>> getOrderDetails(int id);
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final NetworkService networkService;

  OrdersRemoteDataSourceImpl({required this.networkService});

  @override
  Future<Either<Failure, PaginatedData<CustomerOrderModel>>> getOrders({int page = 1}) async {
    final response = await networkService.getData(
      endPoint: EndPoints.customerOrders,
      queryParameters: {'page': page},
    );

    return response.fold((failure) => Left(failure), (data) {
      if (data['status'] == true) {
        final paginatedData = PaginatedData<CustomerOrderModel>.fromJson(
          data['data'],
          CustomerOrderModel.fromJson,
          'orders',
        );
        return Right(paginatedData);
      } else {
        return Left(
          ServerFailure(message: data['message'] ?? 'Failed to fetch orders'),
        );
      }
    });
  }

  @override
  Future<Either<Failure, CustomerOrderModel>> getOrderDetails(int id) async {
    final response = await networkService.getData(
      endPoint: '${EndPoints.customerOrders}/$id',
    );

    return response.fold((failure) => Left(failure), (data) {
      if (data['status'] == true) {
        final orderData = data['data']['order'];
        return Right(CustomerOrderModel.fromJson(orderData));
      } else {
        return Left(
          ServerFailure(
            message: data['message'] ?? 'Failed to fetch order details',
          ),
        );
      }
    });
  }
}
