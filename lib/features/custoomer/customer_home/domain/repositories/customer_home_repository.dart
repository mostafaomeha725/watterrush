import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/slider_entity.dart';
import '../entities/category_entity.dart';

abstract class CustomerHomeRepository {
  Future<Either<Failure, List<SliderEntity>>> getSliders();
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
