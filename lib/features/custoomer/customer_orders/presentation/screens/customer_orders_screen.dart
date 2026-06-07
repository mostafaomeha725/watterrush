import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/di/services_locator.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/cubit/customer_orders_cubit.dart';
import 'widgets/customer_orders_screen_body.dart';

class CustomerOrdersScreen extends StatelessWidget {
  const CustomerOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CustomerOrdersCubit>()..getOrders(),
      child: const Scaffold(
        backgroundColor: Color(0xFFF9FAFB),
        body: SafeArea(child: CustomerOrdersScreenBody()),
      ),
    );
  }
}
