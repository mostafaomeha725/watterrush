import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/di/services_locator.dart';
import 'package:waterrush/features/auth/presentation/cubit/login_cubit/customer_login_cubit.dart';
import 'package:waterrush/features/auth/presentation/widgets/customer_login_screen_body.dart';

class CustomerLoginScreen extends StatelessWidget {
  const CustomerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CustomerLoginCubit>(),
      child: const Scaffold(
        body: CustomerLoginScreenBody(),
      ),
    );
  }
}