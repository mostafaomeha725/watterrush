import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterrush/core/cache/preferences_storage.dart';
import 'package:waterrush/core/network/network_service.dart';
import 'package:waterrush/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:waterrush/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:waterrush/features/auth/domain/repositories/auth_repository.dart';
import 'package:waterrush/features/auth/domain/usecases/register_customer_usecase.dart';
import 'package:waterrush/features/auth/domain/usecases/login_customer_usecase.dart';
import 'package:waterrush/features/auth/domain/usecases/logout_customer_usecase.dart';
import 'package:waterrush/features/auth/presentation/cubit/customer_register_cubit.dart';
import 'package:waterrush/features/auth/presentation/cubit/customer_login_cubit.dart';
import 'package:waterrush/features/auth/presentation/cubit/customer_logout_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/data/datasources/customer_home_remote_data_source.dart';
import 'package:waterrush/features/custoomer/customer_home/data/repositories/customer_home_repository_impl.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/repositories/customer_home_repository.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/usecases/get_sliders_usecase.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/customer_home_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    /// Core Services
    await _initStorage();
    _initDio();

    /// Features
    _initAuth();
    _initCustomerHome();
  }

  /// =============================
  /// STORAGE
  /// =============================
  Future<void> _initStorage() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPrefs);
    sl.registerLazySingleton(() => PreferencesStorage(sl()));
  }

  /// =============================
  /// NETWORK
  /// =============================
  void _initDio() {
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => NetworkService(sl()));
  }

  /// =============================
  /// AUTH FEATURE
  /// =============================
  void _initAuth() {
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl(), sl()),
    );
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

    sl.registerLazySingleton(() => RegisterCustomerUseCase(sl()));
    sl.registerLazySingleton(() => LoginCustomerUseCase(sl()));
    sl.registerLazySingleton(() => LogoutCustomerUseCase(sl()));

    sl.registerFactory(() => CustomerRegisterCubit(sl()));
    sl.registerFactory(() => CustomerLoginCubit(sl()));
    sl.registerFactory(() => CustomerLogoutCubit(sl()));
  }

  /// =============================
  /// CUSTOMER HOME FEATURE
  /// =============================
  void _initCustomerHome() {
    sl.registerLazySingleton<CustomerHomeRemoteDataSource>(
      () => CustomerHomeRemoteDataSourceImpl(sl()),
    );
    sl.registerLazySingleton<CustomerHomeRepository>(
      () => CustomerHomeRepositoryImpl(sl()),
    );

    sl.registerLazySingleton(() => GetSlidersUseCase(sl()));

    sl.registerFactory(
      () => CustomerHomeCubit(
        bannerCount: 5, // Default or can be dynamic
        getSlidersUseCase: sl(),
      ),
    );
  }
}
