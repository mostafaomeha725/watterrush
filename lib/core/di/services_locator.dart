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
import 'package:waterrush/features/auth/domain/usecases/get_customer_profile_usecase.dart';
import 'package:waterrush/features/auth/presentation/cubit/register_cubit/customer_register_cubit.dart';
import 'package:waterrush/features/auth/presentation/cubit/login_cubit/customer_login_cubit.dart';
import 'package:waterrush/features/auth/presentation/cubit/logout_cubit/customer_logout_cubit.dart';
import 'package:waterrush/features/auth/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:waterrush/features/custoomer/address/data/datasources/address_remote_data_source.dart';
import 'package:waterrush/features/custoomer/address/data/repositories/address_repository_impl.dart';
import 'package:waterrush/features/custoomer/address/domain/repositories/address_repository.dart';
import 'package:waterrush/features/custoomer/address/domain/usecases/get_addresses_usecase.dart';
import 'package:waterrush/features/custoomer/address/domain/usecases/create_address_usecase.dart';
import 'package:waterrush/features/custoomer/address/domain/usecases/update_address_usecase.dart';
import 'package:waterrush/features/custoomer/address/domain/usecases/set_default_address_usecase.dart';
import 'package:waterrush/features/custoomer/address/domain/usecases/delete_address_usecase.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_cubit.dart';

import 'package:waterrush/features/custoomer/customer_home/data/datasources/customer_home_remote_data_source.dart';
import 'package:waterrush/features/custoomer/customer_home/data/repositories/customer_home_repository_impl.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/repositories/customer_home_repository.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/usecases/get_sliders_usecase.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/usecases/get_categories_usecase.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/usecases/get_category_products_usecase.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/usecases/get_popular_products_usecase.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/usecases/get_product_details_usecase.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/category_products_cubit/category_products_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/product_details_cubit/product_details_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/data/datasources/cart_remote_data_source.dart';
import 'package:waterrush/features/custoomer/customer_cart/data/repositories/cart_repository_impl.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/repositories/cart_repository.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/usecases/get_cart_usecase.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/usecases/remove_cart_item_usecase.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/usecases/clear_cart_usecase.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/usecases/get_scheduled_times_usecase.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/usecases/place_order_usecase.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/checkout_cubit/checkout_cubit.dart';
import 'package:waterrush/features/custoomer/customer_offers/data/datasources/offers_remote_data_source.dart';
import 'package:waterrush/features/custoomer/customer_offers/data/repositories/offers_repository_impl.dart';
import 'package:waterrush/features/custoomer/customer_offers/domain/repositories/offers_repository.dart';
import 'package:waterrush/features/custoomer/customer_offers/domain/usecases/get_promo_codes_usecase.dart';
import 'package:waterrush/features/custoomer/customer_offers/presentation/cubit/offers_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    /// Core Services
    await _initStorage();
    _initDio();

    /// Features
    _initAuth();
    _initCustomerHome();
    _initCustomerCart();
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
    sl.registerLazySingleton(() => GetCustomerProfileUseCase(sl()));

    sl.registerFactory(() => CustomerRegisterCubit(sl()));
    sl.registerFactory(() => CustomerLoginCubit(sl()));
    sl.registerFactory(() => CustomerLogoutCubit(sl()));
    sl.registerFactory(() => ProfileCubit(sl()));
  }

  /// =============================
  /// CUSTOMER HOME FEATURE
  /// =============================
  void _initCustomerHome() {
    sl.registerLazySingleton<CustomerHomeRemoteDataSource>(
      () => CustomerHomeRemoteDataSourceImpl(sl()),
    );

    sl.registerLazySingleton<AddressRemoteDataSource>(
      () => AddressRemoteDataSourceImpl(sl()),
    );

    sl.registerLazySingleton<CustomerHomeRepository>(
      () => CustomerHomeRepositoryImpl(sl()),
    );

    sl.registerLazySingleton<AddressRepository>(
      () => AddressRepositoryImpl(sl()),
    );

    sl.registerLazySingleton(() => GetSlidersUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoryProductsUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularProductsUseCase(sl()));
    sl.registerLazySingleton(() => GetProductDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetAddressesUseCase(sl()));
    sl.registerLazySingleton(() => CreateAddressUseCase(sl()));
    sl.registerLazySingleton(() => UpdateAddressUseCase(sl()));
    sl.registerLazySingleton(() => SetDefaultAddressUseCase(sl()));
    sl.registerLazySingleton(() => DeleteAddressUseCase(sl()));

    sl.registerFactory(
      () => CustomerHomeCubit(
        bannerCount: 5, // Default or can be dynamic
        getSlidersUseCase: sl(),
        getCategoriesUseCase: sl(),
        getPopularProductsUseCase: sl(),
      ),
    );

    sl.registerFactoryParam<CategoryProductsCubit, dynamic, dynamic>(
      (category, _) => CategoryProductsCubit(
        category: category,
        getCategoryProductsUseCase: sl(),
      ),
    );

    sl.registerFactoryParam<ProductDetailsCubit, dynamic, dynamic>(
      (productId, _) => ProductDetailsCubit(
        productId: productId,
        getProductDetailsUseCase: sl(),
      ),
    );

    sl.registerFactory(
      () => AddressCubit(
        getAddressesUseCase: sl(),
        createAddressUseCase: sl(),
        updateAddressUseCase: sl(),
        setDefaultAddressUseCase: sl(),
        deleteAddressUseCase: sl(),
      ),
    );
  }

  /// =============================
  /// CUSTOMER CART FEATURE
  /// =============================
  void _initCustomerCart() {
    sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(networkService: sl()),
    );

    sl.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(remoteDataSource: sl()),
    );

    sl.registerLazySingleton(() => GetCartUseCase(sl()));
    sl.registerLazySingleton(() => RemoveCartItemUseCase(sl()));
    sl.registerLazySingleton(() => ClearCartUseCase(sl()));
    sl.registerLazySingleton(() => GetScheduledTimesUseCase(sl()));
    sl.registerLazySingleton(() => PlaceOrderUseCase(sl()));

    sl.registerFactory(
      () => CartCubit(
        getCartUseCase: sl(),
        removeCartItemUseCase: sl(),
        clearCartUseCase: sl(),
      ),
    );

    sl.registerFactory(
      () => CheckoutCubit(
        getScheduledTimesUseCase: sl(),
        placeOrderUseCase: sl(),
      ),
    );

    // Offers
    sl.registerLazySingleton<OffersRemoteDataSource>(
      () => OffersRemoteDataSourceImpl(networkService: sl()),
    );
    sl.registerLazySingleton<OffersRepository>(
      () => OffersRepositoryImpl(remoteDataSource: sl()),
    );
    sl.registerLazySingleton(() => GetPromoCodesUseCase(sl()));
    sl.registerFactory(() => OffersCubit(getPromoCodesUseCase: sl()));
  }
}
