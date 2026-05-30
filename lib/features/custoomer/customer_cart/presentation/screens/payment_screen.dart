import 'package:flutter/material.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/payment_screen_body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: PaymentScreenBody(),
    );
  }
}