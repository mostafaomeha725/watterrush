import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network/endpoints.dart';
import '../../../../../core/network/network_service.dart';
import '../models/address_model.dart';

abstract class AddressRemoteDataSource {
  Future<Either<Failure, List<AddressModel>>> getAddresses();
  Future<Either<Failure, AddressModel>> createAddress(
    Map<String, dynamic> data,
  );
  Future<Either<Failure, AddressModel>> updateAddress(
    int id,
    Map<String, dynamic> data,
  );
  Future<Either<Failure, AddressModel>> setDefaultAddress(int id);
  Future<Either<Failure, void>> deleteAddress(int id);
}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final NetworkService networkService;

  AddressRemoteDataSourceImpl(this.networkService);

  @override
  Future<Either<Failure, List<AddressModel>>> getAddresses() async {
    final response = await networkService.getData(
      endPoint: EndPoints.customerAddresses,
    );

    return response.fold((failure) => Left(failure), (data) {
      try {
        final addressesList = (data['data']['addresses'] as List)
            .map((json) => AddressModel.fromJson(json))
            .toList();
        return Right(addressesList);
      } catch (e) {
        return Left(Failure('Failed to parse addresses data'));
      }
    });
  }

  @override
  Future<Either<Failure, AddressModel>> createAddress(
    Map<String, dynamic> data,
  ) async {
    final response = await networkService.postData(
      endPoint: EndPoints.customerAddresses,
      data: data,
    );

    return response.fold((failure) => Left(failure), (data) {
      try {
        final address = AddressModel.fromJson(data['data']['address']);
        return Right(address);
      } catch (e) {
        return Left(Failure('Failed to parse created address data'));
      }
    });
  }

  @override
  Future<Either<Failure, AddressModel>> updateAddress(
    int id,
    Map<String, dynamic> data,
  ) async {
    final response = await networkService.putData(
      endPoint: '${EndPoints.customerAddresses}/$id',
      data: data,
    );

    return response.fold((failure) => Left(failure), (data) {
      try {
        if (data['status'] == true) {
          final address = AddressModel.fromJson(data['data']['address']);
          return Right(address);
        }
        return Left(
          ServerFailure(message: data['message'] ?? 'Failed to update address'),
        );
      } catch (e) {
        return Left(Failure('Failed to parse updated address data'));
      }
    });
  }

  @override
  Future<Either<Failure, AddressModel>> setDefaultAddress(int id) async {
    try {
      final response = await networkService.postData(
        endPoint: '${EndPoints.customerAddresses}/$id/set-default',
      );

      return response.fold((failure) => Left(failure), (data) {
        if (data['status'] == true) {
          return Right(AddressModel.fromJson(data['data']['address']));
        }
        return Left(
          ServerFailure(
            message: data['message'] ?? 'Failed to set default address',
          ),
        );
      });
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAddress(int id) async {
    try {
      final response = await networkService.deleteData(
        endPoint: '${EndPoints.customerAddresses}/$id',
      );

      return response.fold(
        (failureMessage) => Left(ServerFailure(message: failureMessage)),
        (data) {
          if (data['status'] == true) {
            return const Right(null);
          }
          return Left(
            ServerFailure(
              message: data['message'] ?? 'Failed to delete address',
            ),
          );
        },
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
