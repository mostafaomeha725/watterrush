import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_orders/data/datasources/orders_remote_data_source.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/repositories/orders_repository.dart';
import 'package:waterrush/core/models/paginated_data.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource remoteDataSource;

  OrdersRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, PaginatedData<CustomerOrderEntity>>> getOrders({int page = 1, String? status}) async {
    return await remoteDataSource.getOrders(page: page, status: status);
  }

  @override
  Future<Either<Failure, CustomerOrderEntity>> getOrderDetails(int id) async {
    return await remoteDataSource.getOrderDetails(id);
  }
}
