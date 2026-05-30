import 'package:flutter/material.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/deliver_home_screen.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/driver_profile_screen.dart';

class DeliverNavData {
  static final List<Map<String, dynamic>> items = [
    {'label': 'Home', 'assetPath': Assets.homeButton},
    {'label': 'Profile', 'assetPath': Assets.user},
  ];

  static final List<Widget> screens = [
    const DeliverHomeScreen(),
    const DriverProfileScreen(),
  ];
}