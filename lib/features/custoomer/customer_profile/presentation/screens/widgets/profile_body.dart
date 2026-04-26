import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/bouncing_social_button.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_contact_card.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_demo_data.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_hero_header.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_order_history_section.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileHeroHeader(
            name: 'Mohamed Salah',
            subtitle: 'Stay hydrated, stay healthy.',
            phone: '+20 123 456 7890',
            imageUrl: 'https://i.pravatar.cc/240?img=11',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                const ProfileContactCard(
                  location: '45 Nile Street, Giza, Egypt',
                  phone: '+20 123 456 7890',
                ),
                SizedBox(height: 12.h),
                BouncingSocialButton(
                  text: 'Logout',
                  onTap: () {},
                  textColor: const Color(0xFFE53E3E),
                  color: Colors.white,
                  radius: 20.r,
                  height: 52.h,
                  textSize: 16.sp,
                  borderColor: const Color(0x55E53E3E),
                  leading: Icon(
                    Icons.logout_rounded,
                    size: 18.sp,
                    color: const Color(0xFFE53E3E),
                  ),
                ),
                SizedBox(height: 12.h),
                ProfileOrderHistorySection(orders: ProfileDemoData.orders),
                SizedBox(height: 104.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
