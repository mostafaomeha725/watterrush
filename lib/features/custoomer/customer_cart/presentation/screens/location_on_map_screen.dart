import 'package:flutter/material.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/location_on_map_screen_body.dart';

class LocationOnMapScreen extends StatelessWidget {
  const LocationOnMapScreen({super.key, this.initialSelection});

  final Map<String, dynamic>? initialSelection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: LocationOnMapScreenBody(initialSelection: initialSelection),
    );
  }
}