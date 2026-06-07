import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/helpers/helpers.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/support_chat_header.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/support_chat_input_bar.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/support_chat_message_bubble.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/support_chat_quick_action_chip.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/support_chat_sender_tag.dart';

class SupportChatScreenBody extends StatefulWidget {
  const SupportChatScreenBody({super.key});

  @override
  State<SupportChatScreenBody> createState() => _SupportChatScreenBodyState();
}

class _SupportChatScreenBodyState extends State<SupportChatScreenBody> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color dividerColor = Color(0xFF1F2F43);

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(22.w, 12.h, 22.w, 10.h),
            child: SupportChatHeader(onBackTap: context.pop),
          ),
          const Divider(height: 1, color: dividerColor),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(22.w, 12.h, 22.w, 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SupportChatSenderTag(),
                  verticalSpacing(6),
                  SupportChatMessageBubble(
                    message: 'Hi! How can I help you today?',
                    time: '2:45 PM',
                    isUser: false,
                  ),
                  verticalSpacing(10),
                  SupportChatMessageBubble(
                    message: 'When will my order arrive?',
                    time: '2:46 PM',
                    isUser: true,
                  ),
                  verticalSpacing(10),
                  const SupportChatSenderTag(),
                  verticalSpacing(6),
                  SupportChatMessageBubble(
                    message:
                        'Your order is out for delivery and\nshould arrive within 8 minutes.\nYou can track it in real-time!',
                    time: '2:47 PM',
                    isUser: false,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(22.w, 10.h, 22.w, 10.h),
            decoration: BoxDecoration(
              color: Color(0xFFF8FAFC),
              border: const Border(top: BorderSide(color: dividerColor)),
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SupportChatQuickActionChip(
                        label: "Where's my order?",
                        onTap: () {},
                      ),
                      SizedBox(width: 8.w),
                      SupportChatQuickActionChip(
                        label: 'Change address',
                        onTap: () {},
                      ),
                      SizedBox(width: 8.w),
                      SupportChatQuickActionChip(
                        label: 'Report issue',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                verticalSpacing(10),
                SupportChatInputBar(
                  controller: _messageController,
                  onSendTap: () {},
                  onAttachmentTap: () {
                    Helpers.pickSupportChatAttachment(context: context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
