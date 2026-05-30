import 'package:flutter/material.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_stat_card.dart';

class DeliverHomeHeaderStatsRow extends StatelessWidget {
  const DeliverHomeHeaderStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: DeliverHomeStatCard(value: '7', label: 'Today · Deliveries'),
        ),
        horizontalSpacing(10),
        const Expanded(
          child: DeliverHomeStatCard(value: '380', label: 'Earned · EGP'),
        ),
        horizontalSpacing(10),
        const Expanded(
          child: DeliverHomeStatCard(value: '4.9', label: 'Rating ⭐'),
        ),
      ],
    );
  }
}