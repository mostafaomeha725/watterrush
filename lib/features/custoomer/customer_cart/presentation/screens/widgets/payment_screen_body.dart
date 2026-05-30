import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/helpers/helpers.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/payment_delivery_details_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/payment_method_option_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/payment_order_summary_card.dart';

class PaymentScreenBody extends StatefulWidget {
  const PaymentScreenBody({super.key});

  @override
  State<PaymentScreenBody> createState() => _PaymentScreenBodyState();
}

class _PaymentScreenBodyState extends State<PaymentScreenBody> {
  final ValueNotifier<int> _selectedPaymentMethodIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    _selectedPaymentMethodIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  verticalSpacing(18),
                  AppText(
                    'Select Payment Method',
                    style: font16w700.copyWith(color: const Color(0xFF091D35)),
                  ),
                  verticalSpacing(12),
                  ValueListenableBuilder<int>(
                    valueListenable: _selectedPaymentMethodIndex,
                    builder: (context, selectedIndex, _) {
                      return Column(
                        children: [
                          PaymentMethodOptionCard(
                            title: 'Cash on Delivery',
                            subtitle: 'Pay when you receive',
                            icon: Icons.payments_outlined,
                            isSelected: selectedIndex == 0,
                            onTap: () => _selectedPaymentMethodIndex.value = 0,
                          ),
                          verticalSpacing(10),
                          PaymentMethodOptionCard(
                            title: 'WaterRush Wallet',
                            subtitle: 'Balance: \$45.00',
                            icon: Icons.account_balance_wallet_outlined,
                            isSelected: selectedIndex == 1,
                            onTap: () => _selectedPaymentMethodIndex.value = 1,
                          ),
                          verticalSpacing(10),
                          PaymentMethodOptionCard(
                            title: 'Credit/Debit Card',
                            subtitle: 'Add new card',
                            icon: Icons.credit_card_outlined,
                            isSelected: selectedIndex == 2,
                            onTap: () => _selectedPaymentMethodIndex.value = 2,
                          ),
                        ],
                      );
                    },
                  ),
                  verticalSpacing(18),
                  const PaymentOrderSummaryCard(),
                  verticalSpacing(14),
                  PaymentDeliveryDetailsCard(onChangeTap: context.pop),
                  verticalSpacing(18),

                  verticalSpacing(10),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 14.h),
              child: AppButton(
                text: 'Confirm Order - \$27.77',
                onPressed: () {
                  Helpers.proceedToTrackOrder(context: context);
                },
                color: AppLightColors.buttonColor,
                radius: 14.r,
                textColor: Colors.white,
                textSize: 16.sp,
                textWeight: FontWeight.w700,
                height: 52.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: context.pop,
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFD9E2EC)),
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 18.sp,
              color: const Color(0xFF1B3A57),
            ),
          ),
        ),
        horizontalSpacing(12),
        Expanded(
          child: AppText(
            'Payment',
            style: font20w700.copyWith(color: const Color(0xFF0E2742)),
          ),
        ),
      ],
    );
  }
}