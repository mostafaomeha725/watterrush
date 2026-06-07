import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/core/network/endpoints.dart';
import 'package:waterrush/core/network/network_service.dart';
import 'package:waterrush/features/custoomer/customer_orders/data/models/customer_order_model.dart';

abstract class OrdersRemoteDataSource {
  Future<Either<Failure, List<CustomerOrderModel>>> getOrders();
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final NetworkService networkService;

  OrdersRemoteDataSourceImpl({required this.networkService});

  @override
  Future<Either<Failure, List<CustomerOrderModel>>> getOrders() async {
    final response = await networkService.getData(
      endPoint: EndPoints.customerOrders,
    );

    return response.fold((failure) => Left(failure), (data) {
      if (data['status'] == true) {
        final List ordersList = data['data']['orders'] ?? [];
        final List<CustomerOrderModel> orders = ordersList
            .map((item) => CustomerOrderModel.fromJson(item))
            .toList();
        return Right(orders);
      } else {
        return Left(
          ServerFailure(message: data['message'] ?? 'Failed to fetch orders'),
        );
      }
    });
  }
}
