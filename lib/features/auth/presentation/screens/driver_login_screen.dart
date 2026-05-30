import 'package:flutter/material.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_phone_login_screen_body.dart';

class DriverLoginScreen extends StatelessWidget {
  const DriverLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthPhoneLoginScreenBody(
        title: 'Driver Login',
        subtitle: 'Enter your registered phone number',
        phoneHint: '(555) 000-0000',
        mode: AuthLoginMode.driver,
      ),
    );
  }
}