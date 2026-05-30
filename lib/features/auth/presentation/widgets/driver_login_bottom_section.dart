import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/auth/presentation/widgets/driver_login_earn_more_card.dart';
import 'package:waterrush/features/auth/presentation/widgets/driver_login_stats_card.dart';

class DriverLoginBottomSection extends StatelessWidget {
  const DriverLoginBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DriverLoginStatsCard(),
        SizedBox(height: 12.h),
        const DriverLoginEarnMoreCard(),
      ],
    );
  }
}