import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_info_raw.dart';

class ProfileContactCard extends StatelessWidget {
  const ProfileContactCard({
    super.key,
    required this.location,
    this.locationTitle,
    required this.phone,
    this.onAddressTap,
  });

  final String location;
  final String? locationTitle;
  final String phone;
  final VoidCallback? onAddressTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: const Color(0xFFE4ECF7)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFBCCEE5).withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ProfileInfoRow(
            icon: Icons.location_on_rounded,
            title: locationTitle ?? 'Saved Location',
            subtitle: location,
            onTap: onAddressTap,
          ),
          Divider(height: 1.h, color: const Color(0xFFE4ECF7)),
          ProfileInfoRow(
            icon: Icons.phone_rounded,
            title: 'Phone Number',
            subtitle: phone,
            showChevron: false,
          ),
        ],
      ),
    );
  }
}
