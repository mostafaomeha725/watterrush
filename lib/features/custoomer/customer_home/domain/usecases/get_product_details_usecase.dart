import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/entities/product_entity.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/repositories/customer_home_repository.dart';

class GetProductDetailsUseCase {
  final CustomerHomeRepository repository;

  GetProductDetailsUseCase(this.repository);

  Future<Either<Failure, ProductEntity>> call(int productId) async {
    return await repository.getProductDetails(productId);
  }
}
