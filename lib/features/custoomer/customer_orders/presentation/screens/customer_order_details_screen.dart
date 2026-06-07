import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/di/services_locator.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/cubit/customer_order_details_cubit.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/order_details/customer_order_details_screen_body.dart';

class CustomerOrderDetailsScreen extends StatelessWidget {
  final CustomerOrderEntity order;

  const CustomerOrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerOrderDetailsCubit>()..getOrderDetails(order.id),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: CustomerOrderDetailsScreenBody(order: order)),
      ),
    );
  }
}
