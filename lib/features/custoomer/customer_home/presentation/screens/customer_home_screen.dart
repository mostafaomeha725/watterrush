import 'package:flutter/material.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_screen_body.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF3F6FB),
      body: CustomerHomeScreenBody(),
    );
  }
}
