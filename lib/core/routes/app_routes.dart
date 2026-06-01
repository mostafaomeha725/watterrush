import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/cache/preferences_storage.dart';
import 'package:waterrush/core/di/services_locator.dart';
import 'package:waterrush/core/widgets/custom_nav_bar.dart';
import 'package:waterrush/features/auth/presentation/screens/auth_type_screen.dart';
import 'package:waterrush/features/auth/presentation/screens/customer_login_screen.dart';
import 'package:waterrush/features/auth/presentation/screens/customer_register_screen.dart';
import 'package:waterrush/features/auth/presentation/screens/driver_login_screen.dart';
import 'package:waterrush/features/auth/presentation/screens/otp_screen.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/checkout_screen.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/location_on_map_screen.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/payment_screen.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/support_chat_screen.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/track_order_screen.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/all_categories_screen.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/category_products_screen.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/offer_details_screen.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/special_offers_screen.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/product_details_screen.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/all_popular_products_screen.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_mock_data.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/driver_delivery_details_screen.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/driver_delivery_map_screen.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/driver_delivery_success_screen.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';
import '/core/env.dart';
import 'route_observer.dart';
import 'route_paths.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final CustomGoRouterObserver customGoRouterObserver = CustomGoRouterObserver();

GoRouter createRouter() {
  final prefs = sl<PreferencesStorage>();
  final hasToken = prefs.getUserToken() != null && prefs.getUserToken()!.isNotEmpty;

  return GoRouter(
    initialLocation: hasToken ? Routes.mainNavigationScreen : Routes.authTypeScreen,
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    observers: [
      if (isDevEnviroment()) ChuckerFlutter.navigatorObserver,
      // customGoRouterObserver,
    ],
    routes: [
      GoRoute(
        path: Routes.authTypeScreen,
        builder: (context, state) => const AuthTypeScreen(),
      ),
      GoRoute(
        path: Routes.customerLoginScreen,
        builder: (context, state) => const CustomerLoginScreen(),
      ),
      GoRoute(
        path: Routes.registerScreen,
        builder: (context, state) => const CustomerRegisterScreen(),
      ),
      GoRoute(
        path: Routes.driverLoginScreen,
        builder: (context, state) => const DriverLoginScreen(),
      ),
      GoRoute(
        path: Routes.otpScreen,
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: Routes.mainNavigationScreen,
        builder: (context, state) {
          final bool isCustomer = state.extra is bool
              ? state.extra as bool
              : true;
          return CustomNavBar(isCustomer: isCustomer);
        },
      ),
      GoRoute(
        path: Routes.checkoutScreen,
        builder: (context, state) {
          final promoCode = state.extra is String ? state.extra as String : null;
          return CheckoutScreen(promoCode: promoCode);
        },
      ),
      GoRoute(
        path: Routes.offerDetailsScreen,
        builder: (context, state) {
          final OfferSliderItemData? selectedOffer =
              state.extra is OfferSliderItemData
              ? state.extra as OfferSliderItemData
              : null;
          return OfferDetailsScreen(offer: selectedOffer);
        },
      ),
      GoRoute(
        path: Routes.specialOffersScreen,
        builder: (context, state) {
          final List<OfferSliderItemData> selectedOffers =
              state.extra is List<OfferSliderItemData>
              ? state.extra as List<OfferSliderItemData>
              : customerHomeOffers;
          return SpecialOffersScreen(offers: selectedOffers);
        },
      ),
      GoRoute(
        path: Routes.allCategoriesScreen,
        builder: (context, state) {
          final List<CategoryItemData> selectedCategories =
              state.extra is List<CategoryItemData>
              ? state.extra as List<CategoryItemData>
              : <CategoryItemData>[];
          return AllCategoriesScreen(categories: selectedCategories);
        },
      ),
      GoRoute(
        path: Routes.categoryProductsScreen,
        builder: (context, state) {
          final CategoryItemData? selectedCategory =
              state.extra is CategoryItemData
              ? state.extra as CategoryItemData
              : null;
          return CategoryProductsScreen(category: selectedCategory);
        },
      ),
      GoRoute(
        path: Routes.locationOnMapScreen,
        builder: (context, state) {
          final Map<String, dynamic>? initialSelection =
              state.extra is Map<String, dynamic>
              ? state.extra as Map<String, dynamic>
              : null;
          return LocationOnMapScreen(initialSelection: initialSelection);
        },
      ),
      GoRoute(
        path: Routes.paymentScreen,
        builder: (context, state) => const PaymentScreen(),
      ),
      GoRoute(
        path: Routes.trackOrderScreen,
        builder: (context, state) => const TrackOrderScreen(),
      ),
      GoRoute(
        path: Routes.supportChatScreen,
        builder: (context, state) => const SupportChatScreen(),
      ),
      GoRoute(
        path: Routes.driverDeliveryDetailsScreen,
        builder: (context, state) {
          final DeliverOrderModel order = state.extra is DeliverOrderModel
              ? state.extra as DeliverOrderModel
              : DeliverHomeDemoData.orders[0];

          return DriverDeliveryDetailsScreen(order: order);
        },
      ),
      GoRoute(
        path: Routes.driverDeliveryMapScreen,
        builder: (context, state) {
          final DeliverOrderModel order = state.extra is DeliverOrderModel
              ? state.extra as DeliverOrderModel
              : DeliverHomeDemoData.orders[0];

          return DriverDeliveryMapScreen(order: order);
        },
      ),
      GoRoute(
        path: Routes.driverDeliverySuccessScreen,
        builder: (context, state) {
          final DeliverOrderModel order = state.extra is DeliverOrderModel
              ? state.extra as DeliverOrderModel
              : DeliverHomeDemoData.orders[0];

          return DriverDeliverySuccessScreen(order: order);
        },
      ),
      GoRoute(
        path: Routes.productDetailsScreen,
        builder: (context, state) {
          final int productId = state.extra is int ? state.extra as int : 0;
          return ProductDetailsScreen(productId: productId);
        },
      ),
      GoRoute(
        path: Routes.allPopularProductsScreen,
        builder: (context, state) => const AllPopularProductsScreen(),
      ),
    ],
  );
}