import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/models/paginated_data.dart';
import '../../../../../core/network/endpoints.dart';
import '../../../../../core/network/network_service.dart';
import '../models/slider_model.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

abstract class CustomerHomeRemoteDataSource {
  Future<Either<Failure, List<SliderModel>>> getSliders();
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, PaginatedData<ProductModel>>> getCategoryProducts(
    int categoryId, {
    int page = 1,
  });
  Future<Either<Failure, PaginatedData<ProductModel>>> getPopularProducts({
    int page = 1,
  });
  Future<Either<Failure, ProductModel>> getProductDetails(int productId);
}

class CustomerHomeRemoteDataSourceImpl implements CustomerHomeRemoteDataSource {
  final NetworkService networkService;

  CustomerHomeRemoteDataSourceImpl(this.networkService);

  @override
  Future<Either<Failure, List<SliderModel>>> getSliders() async {
    final response = await networkService.getData(
      endPoint: EndPoints.customerSliders,
    );

    return response.fold((failure) => Left(failure), (data) {
      try {
        final slidersList = (data['data']['sliders'] as List)
            .map((json) => SliderModel.fromJson(json))
            .toList();
        return Right(slidersList);
      } catch (e) {
        return Left(Failure('Failed to parse sliders data'));
      }
    });
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    final response = await networkService.getData(
      endPoint: EndPoints.customerCategories,
    );

    return response.fold((failure) => Left(failure), (data) {
      try {
        final categoriesList = (data['data']['categories'] as List)
            .map((json) => CategoryModel.fromJson(json))
            .toList();
        return Right(categoriesList);
      } catch (e) {
        return Left(Failure('Failed to parse categories data'));
      }
    });
  }

  @override
  Future<Either<Failure, PaginatedData<ProductModel>>> getCategoryProducts(
    int categoryId, {
    int page = 1,
  }) async {
    final response = await networkService.getData(
      endPoint: EndPoints.customerProducts,
      queryParameters: {'category_id': categoryId, 'page': page},
    );

    return response.fold((failure) => Left(failure), (data) {
      try {
        final paginatedData = PaginatedData<ProductModel>.fromJson(
          data['data'],
          ProductModel.fromJson,
          'products',
        );
        return Right(paginatedData);
      } catch (e) {
        return Left(Failure('Failed to parse category products data'));
      }
    });
  }

  @override
  Future<Either<Failure, PaginatedData<ProductModel>>> getPopularProducts({
    int page = 1,
  }) async {
    final response = await networkService.getData(
      endPoint: EndPoints.customerProducts,
      queryParameters: {'page': page},
    );

    return response.fold((failure) => Left(failure), (data) {
      try {
        final paginatedData = PaginatedData<ProductModel>.fromJson(
          data['data'],
          ProductModel.fromJson,
          'products',
        );
        return Right(paginatedData);
      } catch (e) {
        return Left(Failure('Failed to parse popular products data'));
      }
    });
  }

  @override
  Future<Either<Failure, ProductModel>> getProductDetails(int productId) async {
    final response = await networkService.getData(
      endPoint: '${EndPoints.customerProducts}/$productId',
    );

    return response.fold((failure) => Left(failure), (data) {
      try {
        final product = ProductModel.fromJson(data['data']['product']);
        return Right(product);
      } catch (e) {
        return Left(Failure('Failed to parse product details data'));
      }
    });
  }
}
