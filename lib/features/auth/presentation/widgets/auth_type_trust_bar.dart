import 'package:flutter/material.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_trust_divider.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_trust_item.dart';

class AuthTypeTrustBar extends StatelessWidget {
  const AuthTypeTrustBar({this.fastDeliverySubtitle = 'In Minutes', super.key});

  final String fastDeliverySubtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          const Expanded(
            child: AuthTypeTrustItem(
              icon: Icons.shield_outlined,
              title: 'Safe & Secure',
              subtitle: '100% Trusted',
            ),
          ),
          const AuthTypeTrustDivider(),
          Expanded(
            child: AuthTypeTrustItem(
              icon: Icons.flash_on_rounded,
              title: 'Fast Delivery',
              subtitle: fastDeliverySubtitle,
            ),
          ),
          const AuthTypeTrustDivider(),
          const Expanded(
            child: AuthTypeTrustItem(
              icon: Icons.water_drop_outlined,
              title: 'Pure & Fresh',
              subtitle: 'Quality Assured',
            ),
          ),
        ],
      ),
    );
  }
}
