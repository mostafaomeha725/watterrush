import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_offers/domain/entities/promo_code_entity.dart';

abstract class OffersRepository {
  Future<Either<Failure, List<PromoCodeEntity>>> getPromoCodes();
}
