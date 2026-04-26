import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_header_identity_row.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_header_top_row.dart';
import 'package:waterrush/features/driver/driver_profile/presentation/screens/widgets/driver_profile_models.dart';

class DriverProfileHeaderCard extends StatelessWidget {
  const DriverProfileHeaderCard({super.key, required this.profile});

  final DriverProfileData profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(22.w, 36.h, 22.w, 32.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Color(0xFF1B4FA4), Color(0xFF0D8DDB)],
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        children: <Widget>[
          const DriverProfileHeaderTopRow(),
          SizedBox(height: 12.h),
          DriverProfileHeaderIdentityRow(profile: profile),
        ],
      ),
    );
  }
}
