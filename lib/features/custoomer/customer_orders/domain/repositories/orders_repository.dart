import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';
import 'package:waterrush/core/models/paginated_data.dart';

abstract class OrdersRepository {
  Future<Either<Failure, PaginatedData<CustomerOrderEntity>>> getOrders({int page = 1, String? status});
  Future<Either<Failure, CustomerOrderEntity>> getOrderDetails(int id);
}
