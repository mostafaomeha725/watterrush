import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_offers/domain/entities/promo_code_entity.dart';
import 'package:waterrush/features/custoomer/customer_offers/domain/repositories/offers_repository.dart';

class GetPromoCodesUseCase {
  final OffersRepository repository;

  GetPromoCodesUseCase(this.repository);

  Future<Either<Failure, List<PromoCodeEntity>>> call() async {
    return await repository.getPromoCodes();
  }
}
