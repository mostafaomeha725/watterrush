import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/bouncing_social_button.dart';
import 'package:waterrush/core/widgets/navbar_page_app_bar.dart';
import 'package:waterrush/features/custoomer/customer_subscribe/presentation/screens/widgets/subscribe_active_subscriptions_card.dart';
import 'package:waterrush/features/custoomer/customer_subscribe/presentation/screens/widgets/subscribe_benefits_card.dart';
import 'package:waterrush/features/custoomer/customer_subscribe/presentation/screens/widgets/subscribe_frequency_card.dart';
import 'package:waterrush/features/custoomer/customer_subscribe/presentation/screens/widgets/subscribe_option_models.dart';
import 'package:waterrush/features/custoomer/customer_subscribe/presentation/screens/widgets/subscribe_product_card.dart';
import 'package:waterrush/features/custoomer/customer_subscribe/presentation/screens/widgets/subscribe_section_label.dart';

class CustomerSubscribeScreen extends StatefulWidget {
  const CustomerSubscribeScreen({super.key});

  @override
  State<CustomerSubscribeScreen> createState() =>
      _CustomerSubscribeScreenState();
}

class _CustomerSubscribeScreenState extends State<CustomerSubscribeScreen> {
  final List<SubscribeFrequencyOption> _frequencies =
      const <SubscribeFrequencyOption>[
        SubscribeFrequencyOption(
          title: 'Weekly',
          cadence: 'Every 7 days',
          discount: '10% OFF',
        ),
        SubscribeFrequencyOption(
          title: 'Bi-Weekly',
          cadence: 'Every 14 days',
          discount: '15% OFF',
        ),
        SubscribeFrequencyOption(
          title: 'Monthly',
          cadence: 'Every 30 days',
          discount: '20% OFF',
        ),
      ];

  final List<SubscribeProductOption> _products = const <SubscribeProductOption>[
    SubscribeProductOption(
      title: 'Aquafina 12-Pack',
      priceLabel: '\$8.99/delivery',
      icon: Icons.water_drop,
    ),
    SubscribeProductOption(
      title: '5-Gallon Jug',
      priceLabel: '\$12.99/delivery',
      icon: Icons.local_drink,
    ),
    SubscribeProductOption(
      title: 'Dasani 12-Pack',
      priceLabel: '\$7.99/delivery',
      icon: Icons.water_drop,
    ),
  ];

  static const List<String> _benefits = <String>[
    'Never run out of water',
    'Save up to 20% on every order',
    'Free delivery on subscriptions',
    'Pause or cancel anytime',
  ];

  int _selectedFrequency = 0;
  int _selectedProduct = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 28.h, bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const NavBarPageAppBar(
              title: 'Subscribe',
              subtitle: 'Choose plan, frequency, and products',
              leadingIcon: Icons.card_membership_rounded,
            ),
            verticalSpacing(16),
            const SubscribeBenefitsCard(bullets: _benefits),
            verticalSpacing(24),
            const SubscribeSectionLabel(
              icon: Icons.repeat_rounded,
              title: 'Select Frequency',
            ),
            verticalSpacing(12),
            ...List<Widget>.generate(
              _frequencies.length,
              (int index) => Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: SubscribeFrequencyCard(
                  option: _frequencies[index],
                  selected: _selectedFrequency == index,
                  onTap: () => setState(() => _selectedFrequency = index),
                ),
              ),
            ),
            verticalSpacing(16),
            const SubscribeSectionLabel(
              icon: Icons.water_drop_rounded,
              title: 'Select Product',
            ),
            verticalSpacing(12),
            ...List<Widget>.generate(
              _products.length,
              (int index) => Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: SubscribeProductCard(
                  option: _products[index],
                  selected: _selectedProduct == index,
                  onTap: () => setState(() => _selectedProduct = index),
                ),
              ),
            ),
            verticalSpacing(16),
            const SubscribeActiveSubscriptionsCard(),
            verticalSpacing(20),
            BouncingSocialButton(
              text: 'Create Subscription',
              leading: Icon(
                Icons.card_membership_rounded,
                size: 20.sp,
                color: Colors.white,
              ),
              color: const Color(0xFF0F172A),
              height: 54.h,
              textSize: 16.sp,
            ),
            verticalSpacing(110),
          ],
        ),
      ),
    );
  }
}