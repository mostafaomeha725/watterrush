import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network/endpoints.dart';
import '../../../../../core/network/network_service.dart';
import '../models/slider_model.dart';

abstract class CustomerHomeRemoteDataSource {
  Future<Either<Failure, List<SliderModel>>> getSliders();
}

class CustomerHomeRemoteDataSourceImpl implements CustomerHomeRemoteDataSource {
  final NetworkService networkService;

  CustomerHomeRemoteDataSourceImpl(this.networkService);

  @override
  Future<Either<Failure, List<SliderModel>>> getSliders() async {
    final response = await networkService.getData(
      endPoint: EndPoints.customerSliders,
    );

    return response.fold(
      (failure) => Left(failure),
      (data) {
        try {
          final slidersList = (data['data']['sliders'] as List)
              .map((json) => SliderModel.fromJson(json))
              .toList();
          return Right(slidersList);
        } catch (e) {
          return Left(Failure('Failed to parse sliders data'));
        }
      },
    );
  }
}
