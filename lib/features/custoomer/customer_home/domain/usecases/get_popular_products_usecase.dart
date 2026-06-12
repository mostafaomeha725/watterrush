import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/entities/product_entity.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/repositories/customer_home_repository.dart';
import 'package:waterrush/core/models/paginated_data.dart';

class GetPopularProductsUseCase {
  final CustomerHomeRepository repository;

  GetPopularProductsUseCase(this.repository);

  Future<Either<Failure, PaginatedData<ProductEntity>>> call({int page = 1}) async {
    return await repository.getPopularProducts(page: page);
  }
}
