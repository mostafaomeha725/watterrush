import 'package:flutter/material.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/screens/widgets/order_details/customer_order_details_screen_body.dart';

class CustomerOrderDetailsScreen extends StatelessWidget {
  final String orderId;

  const CustomerOrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomerOrderDetailsScreenBody(orderId: orderId),
      ),
    );
  }
}
