import 'package:flutter/material.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_body.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DriverProfileBody());
  }
}