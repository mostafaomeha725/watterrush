import 'package:flutter/material.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_body.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.white, body: ProfileBody());
  }
}