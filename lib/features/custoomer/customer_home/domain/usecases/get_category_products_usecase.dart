import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/customer_home_repository.dart';
import 'package:waterrush/core/models/paginated_data.dart';

class GetCategoryProductsUseCase {
  final CustomerHomeRepository repository;

  GetCategoryProductsUseCase(this.repository);

  Future<Either<Failure, PaginatedData<ProductEntity>>> call(int categoryId, {int page = 1}) async {
    return await repository.getCategoryProducts(categoryId, page: page);
  }
}
