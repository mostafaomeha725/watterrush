import 'package:flutter/material.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_map_body.dart';

class DriverDeliveryMapScreen extends StatelessWidget {
  const DriverDeliveryMapScreen({super.key, required this.order});

  final DeliverOrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DriverDeliveryMapBody(order: order));
  }
}