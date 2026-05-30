import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/di/services_locator.dart';
import 'package:waterrush/features/auth/presentation/cubit/register_cubit/customer_register_cubit.dart';
import 'package:waterrush/features/auth/presentation/widgets/customer_register_screen_body.dart';

class CustomerRegisterScreen extends StatelessWidget {
  const CustomerRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CustomerRegisterCubit>(),
      child: const Scaffold(body: CustomerRegisterScreenBody()),
    );
  }
}