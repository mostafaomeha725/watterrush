import 'package:flutter/material.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/track_order_screen_body.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: TrackOrderScreenBody(),
    );
  }
}
