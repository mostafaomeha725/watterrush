import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/customer_home_repository.dart';

class GetCategoryProductsUseCase {
  final CustomerHomeRepository repository;

  GetCategoryProductsUseCase(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call(int categoryId) async {
    return await repository.getCategoryProducts(categoryId);
  }
}
