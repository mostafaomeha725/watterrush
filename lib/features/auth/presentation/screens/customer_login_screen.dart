import 'package:flutter/material.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_phone_login_screen_body.dart';

class CustomerLoginScreen extends StatelessWidget {
  const CustomerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthPhoneLoginScreenBody(
        title: 'Welcome to WaterRush',
        subtitle: 'Enter your phone number to continue',
        phoneHint: '501 234 567',
        mode: AuthLoginMode.customer,
        showTerms: true,
      ),
    );
  }
}
