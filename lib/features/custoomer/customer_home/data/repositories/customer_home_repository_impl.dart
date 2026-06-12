import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../domain/entities/slider_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../../../../core/models/paginated_data.dart';
import '../../domain/repositories/customer_home_repository.dart';
import '../datasources/customer_home_remote_data_source.dart';

class CustomerHomeRepositoryImpl implements CustomerHomeRepository {
  final CustomerHomeRemoteDataSource remoteDataSource;

  CustomerHomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<SliderEntity>>> getSliders() async {
    return await remoteDataSource.getSliders();
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    return await remoteDataSource.getCategories();
  }

  @override
  Future<Either<Failure, PaginatedData<ProductEntity>>> getCategoryProducts(
    int categoryId, {
    int page = 1,
  }) async {
    return await remoteDataSource.getCategoryProducts(categoryId, page: page);
  }

  @override
  Future<Either<Failure, PaginatedData<ProductEntity>>> getPopularProducts({
    int page = 1,
  }) async {
    return await remoteDataSource.getPopularProducts(page: page);
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductDetails(
    int productId,
  ) async {
    return await remoteDataSource.getProductDetails(productId);
  }
}
