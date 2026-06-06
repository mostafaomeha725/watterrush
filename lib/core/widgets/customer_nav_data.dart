import 'package:flutter/material.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/customer_cart_screen.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/customer_home_screen.dart';
import 'package:waterrush/features/custoomer/customer_offers/presentation/screens/customer_offers_screen.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/customer_profile_screen.dart';
import 'package:waterrush/features/custoomer/customer_subscribe/presentation/screens/customer_subscribe_screen.dart';

class CustomerNavData {
  static final List<Map<String, dynamic>> items = [
    {'label': 'Home', 'assetPath': Assets.homeButton},
    {'label': 'Subscribe', 'assetPath': Assets.giftAlt},
    {'label': 'Cart', 'assetPath': Assets.shoppingBag, 'badgeCount': 2},
    {'label': 'Offers', 'assetPath': Assets.giftAlt},
    {'label': 'Profile', 'assetPath': Assets.user},
  ];

  static final List<Widget> screens = [
    const CustomerHomeScreen(),
    const CustomerSubscribeScreen(),
    const CustomerCartScreen(),
    const CustomerOffersScreen(),
    const CustomerProfileScreen(),
  ];
}
