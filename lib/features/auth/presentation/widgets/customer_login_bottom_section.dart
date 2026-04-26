import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/auth/presentation/widgets/customer_login_feature_item.dart';

class CustomerLoginBottomSection extends StatelessWidget {
  const CustomerLoginBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: const Color(0xFFE1EAF6), width: 1.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7EA7DC).withValues(alpha: 0.14),
            blurRadius: 14.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: const Column(
        children: [
          CustomerLoginFeatureItem(
            icon: Icons.flash_on_rounded,
            iconBgColor: Color(0xFFEFF6FF),
            iconColor: Color(0xFF2E88FF),
            title: 'Fast Delivery',
            subtitle: 'Get water delivered in minutes',
          ),
          CustomerLoginFeatureItem(
            icon: Icons.water_drop_outlined,
            iconBgColor: Color(0xFFF0F8FF),
            iconColor: Color(0xFF37A2FF),
            title: 'Premium Brands',
            subtitle: 'Choose from top water brands',
          ),
          CustomerLoginFeatureItem(
            icon: Icons.card_giftcard_rounded,
            iconBgColor: Color(0xFFFFF3EB),
            iconColor: Color(0xFFFF7B39),
            title: 'Loyalty Rewards',
            subtitle: 'Earn points with every order',
            showDivider: false,
          ),
        ],
      ),
    );
  }
}
