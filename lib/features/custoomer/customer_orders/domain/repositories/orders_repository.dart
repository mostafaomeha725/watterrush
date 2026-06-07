import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';

abstract class OrdersRepository {
  Future<Either<Failure, List<CustomerOrderEntity>>> getOrders();
  Future<Either<Failure, CustomerOrderEntity>> getOrderDetails(int id);
}
