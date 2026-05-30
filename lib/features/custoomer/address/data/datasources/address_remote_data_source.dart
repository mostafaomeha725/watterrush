import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network/endpoints.dart';
import '../../../../../core/network/network_service.dart';
import '../models/address_model.dart';

abstract class AddressRemoteDataSource {
  Future<Either<Failure, List<AddressModel>>> getAddresses();
  Future<Either<Failure, AddressModel>> createAddress(Map<String, dynamic> data);
}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final NetworkService networkService;

  AddressRemoteDataSourceImpl(this.networkService);

  @override
  Future<Either<Failure, List<AddressModel>>> getAddresses() async {
    final response = await networkService.getData(
      endPoint: EndPoints.customerAddresses,
    );

    return response.fold(
      (failure) => Left(failure),
      (data) {
        try {
          final addressesList = (data['data']['addresses'] as List)
              .map((json) => AddressModel.fromJson(json))
              .toList();
          return Right(addressesList);
        } catch (e) {
          return Left(Failure('Failed to parse addresses data'));
        }
      },
    );
  }

  @override
  Future<Either<Failure, AddressModel>> createAddress(Map<String, dynamic> data) async {
    final response = await networkService.postData(
      endPoint: EndPoints.customerAddresses,
      data: data,
    );

    return response.fold(
      (failure) => Left(failure),
      (data) {
        try {
          final address = AddressModel.fromJson(data['data']['address']);
          return Right(address);
        } catch (e) {
          return Left(Failure('Failed to parse created address data'));
        }
      },
    );
  }
}
