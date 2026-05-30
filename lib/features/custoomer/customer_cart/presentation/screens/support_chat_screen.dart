import 'package:flutter/material.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/support_chat_screen_body.dart';

class SupportChatScreen extends StatelessWidget {
  const SupportChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SupportChatScreenBody(),
    );
  }
}