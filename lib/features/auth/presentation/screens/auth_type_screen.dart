import 'package:flutter/material.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_screen_body.dart';

class AuthTypeScreen extends StatelessWidget {
  const AuthTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AuthTypeScreenBody());
  }
}