import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/slider_entity.dart';
import '../repositories/customer_home_repository.dart';

class GetSlidersUseCase {
  final CustomerHomeRepository repository;

  GetSlidersUseCase(this.repository);

  Future<Either<Failure, List<SliderEntity>>> call() async {
    return await repository.getSliders();
  }
}