import 'package:dartz/dartz.dart';
import 'package:waterrush/core/cache/preferences_storage_keys.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/endpoints.dart';
import '../../../../core/network/network_service.dart';
import '../../../../core/cache/preferences_storage.dart';
import '../models/customer_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, CustomerModel>> registerCustomer({
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
  });

  Future<Either<Failure, CustomerModel>> loginCustomer({
    required String phone,
    required String password,
  });

  Future<Either<Failure, CustomerModel>> getCustomerProfile();

  Future<Either<Failure, CustomerModel>> updateCustomerProfile({
    required String name,
  });

  Future<Either<Failure, void>> logoutCustomer();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkService networkService;
  final PreferencesStorage preferencesStorage;

  AuthRemoteDataSourceImpl(this.networkService, this.preferencesStorage);

  @override
  Future<Either<Failure, CustomerModel>> registerCustomer({
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await networkService.postData(
      endPoint: EndPoints.customerRegister,
      data: {
        'name': name,
        'phone': phone,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );

    return response.fold((failure) => Left(failure), (data) async {
      try {
        final resData = data['data'];
        final token = resData['token'];
        await preferencesStorage.saveUserToken(token);
        networkService.addToken(token);

        final customer = CustomerModel.fromJson(resData['customer']);
        await preferencesStorage.putString(
          key: PreferencesKeys.name,
          value: customer.name,
        );
        await preferencesStorage.putString(
          key: PreferencesKeys.phone,
          value: customer.phone,
        );
        return Right(customer);
      } catch (e) {
        return Left(Failure('Failed to parse user data'));
      }
    });
  }

  @override
  Future<Either<Failure, CustomerModel>> loginCustomer({
    required String phone,
    required String password,
  }) async {
    final response = await networkService.postData(
      endPoint: EndPoints.customerLogin,
      data: {'phone': phone, 'password': password},
    );

    return response.fold((failure) => Left(failure), (data) async {
      try {
        final resData = data['data'];
        final token = resData['token'];
        await preferencesStorage.saveUserToken(token);
        networkService.addToken(token);

        final customer = CustomerModel.fromJson(resData['customer']);
        await preferencesStorage.putString(
          key: PreferencesKeys.name,
          value: customer.name,
        );
        await preferencesStorage.putString(
          key: PreferencesKeys.phone,
          value: customer.phone,
        );
        return Right(customer);
      } catch (e) {
        return Left(Failure('Failed to parse user data'));
      }
    });
  }

  @override
  Future<Either<Failure, void>> logoutCustomer() async {
    final response = await networkService.postData(
      endPoint: EndPoints.customerLogout,
      data: {},
    );

    return response.fold((failure) => Left(failure), (data) async {
      try {
        await preferencesStorage.deleteUserToken();
        networkService.removeToken();
        return const Right(null);
      } catch (e) {
        return Left(Failure('Failed to logout'));
      }
    });
  }

  @override
  Future<Either<Failure, CustomerModel>> getCustomerProfile() async {
    final response = await networkService.getData(
      endPoint: EndPoints.customerProfile,
    );

    return response.fold((failure) => Left(failure), (data) async {
      try {
        final resData = data['data'];
        final customer = CustomerModel.fromJson(resData['customer']);
        await preferencesStorage.putString(
          key: PreferencesKeys.name,
          value: customer.name,
        );
        await preferencesStorage.putString(
          key: PreferencesKeys.phone,
          value: customer.phone,
        );
        return Right(customer);
      } catch (e) {
        return Left(Failure('Failed to parse customer profile data'));
      }
    });
  }

  @override
  Future<Either<Failure, CustomerModel>> updateCustomerProfile({
    required String name,
  }) async {
    final response = await networkService.putData(
      endPoint: EndPoints.customerUpdateProfile,
      data: {'name': name},
    );

    return response.fold((failure) => Left(failure), (data) async {
      try {
        final resData = data['data'];
        final customer = CustomerModel.fromJson(resData['customer']);
        await preferencesStorage.putString(
          key: PreferencesKeys.name,
          value: customer.name,
        );
        await preferencesStorage.putString(
          key: PreferencesKeys.phone,
          value: customer.phone,
        );
        return Right(customer);
      } catch (e) {
        return Left(Failure('Failed to parse updated customer profile data'));
      }
    });
  }
}
