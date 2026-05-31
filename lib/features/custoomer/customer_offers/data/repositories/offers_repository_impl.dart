import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_offers/data/datasources/offers_remote_data_source.dart';
import 'package:waterrush/features/custoomer/customer_offers/domain/entities/promo_code_entity.dart';
import 'package:waterrush/features/custoomer/customer_offers/domain/repositories/offers_repository.dart';

class OffersRepositoryImpl implements OffersRepository {
  final OffersRemoteDataSource remoteDataSource;

  OffersRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PromoCodeEntity>>> getPromoCodes() async {
    return await remoteDataSource.getPromoCodes();
  }
}
