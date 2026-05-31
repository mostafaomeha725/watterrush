import 'package:dartz/dartz.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/core/network/network_service.dart';
import 'package:waterrush/features/custoomer/customer_offers/data/models/promo_code_model.dart';

abstract class OffersRemoteDataSource {
  Future<Either<Failure, List<PromoCodeModel>>> getPromoCodes();
}

class OffersRemoteDataSourceImpl implements OffersRemoteDataSource {
  final NetworkService networkService;

  OffersRemoteDataSourceImpl({required this.networkService});

  @override
  Future<Either<Failure, List<PromoCodeModel>>> getPromoCodes() async {
    final response = await networkService.getData(endPoint: 'customer/promo-codes');

    return response.fold(
      (failure) => Left(failure),
      (data) {
        if (data['status'] == true) {
          final List<dynamic> promoCodesJson = data['data']['promo_codes'] ?? [];
          final promoCodes = promoCodesJson.map((json) => PromoCodeModel.fromJson(json)).toList();
          return Right(promoCodes);
        } else {
          return Left(ServerFailure(message: data['message'] ?? 'Failed to fetch promo codes'));
        }
      },
    );
  }
}
