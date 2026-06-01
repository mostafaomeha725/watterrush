import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/di/services_locator.dart';
import 'package:waterrush/features/auth/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_body.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileCubit>(),
      child: const Scaffold(backgroundColor: Colors.white, body: ProfileBody()),
    );
  }
}
