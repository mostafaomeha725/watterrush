import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/slider_entity.dart';
import '../entities/category_entity.dart';
import '../entities/product_entity.dart';
import '../../../../../core/models/paginated_data.dart';

abstract class CustomerHomeRepository {
  Future<Either<Failure, List<SliderEntity>>> getSliders();
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, PaginatedData<ProductEntity>>> getCategoryProducts(
    int categoryId, {
    int page = 1,
  });
  Future<Either<Failure, PaginatedData<ProductEntity>>> getPopularProducts({
    int page = 1,
  });
  Future<Either<Failure, PaginatedData<ProductEntity>>> getOfferProducts({
    int page = 1,
  });
  Future<Either<Failure, ProductEntity>> getProductDetails(int productId);
}
