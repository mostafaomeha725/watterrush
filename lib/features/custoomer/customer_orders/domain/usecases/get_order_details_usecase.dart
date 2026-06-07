import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/repositories/orders_repository.dart';

class GetOrderDetailsUseCase {
  final OrdersRepository repository;

  GetOrderDetailsUseCase(this.repository);

  Future<Either<Failure, CustomerOrderEntity>> call(int id) async {
    return await repository.getOrderDetails(id);
  }
}
