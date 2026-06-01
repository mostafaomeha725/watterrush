import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/entities/product_entity.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/repositories/customer_home_repository.dart';

class GetPopularProductsUseCase {
  final CustomerHomeRepository repository;

  GetPopularProductsUseCase(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await repository.getPopularProducts();
  }
}
