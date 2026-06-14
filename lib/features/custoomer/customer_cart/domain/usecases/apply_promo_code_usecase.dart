import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import '../repositories/cart_repository.dart';

class ApplyPromoCodeUseCase {
  final CartRepository repository;

  ApplyPromoCodeUseCase(this.repository);

  Future<Either<Failure, Tuple2<String, double>>> call(String code) async {
    return await repository.applyPromoCode(code);
  }
}
