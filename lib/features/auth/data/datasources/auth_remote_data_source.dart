import 'package:dartz/dartz.dart';
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
        return Right(customer);
      } catch (e) {
        return Left(Failure('Failed to parse user data'));
      }
    });
  }
}
