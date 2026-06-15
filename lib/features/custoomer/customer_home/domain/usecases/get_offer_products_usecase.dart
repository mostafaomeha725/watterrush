import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/models/paginated_data.dart';
import '../entities/product_entity.dart';
import '../repositories/customer_home_repository.dart';

class GetOfferProductsUseCase {
  final CustomerHomeRepository repository;

  GetOfferProductsUseCase(this.repository);

  Future<Either<Failure, PaginatedData<ProductEntity>>> call({int page = 1}) async {
    return await repository.getOfferProducts(page: page);
  }
}
