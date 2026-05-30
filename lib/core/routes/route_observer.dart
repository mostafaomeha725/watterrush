import 'package:flutter/material.dart';

class CustomGoRouterObserver extends NavigatorObserver {
  String? previousRoute;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null) {
      this.previousRoute = route.settings.name;
      debugPrint("Returned to: ${route.settings.name}");
    }
  }
}