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
      padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 28.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Color(0xFF0C2461), Color(0xFF1464D8)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(34.r),
          bottomRight: Radius.circular(34.r),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF1464D8).withValues(alpha: 0.28),
            blurRadius: 28.r,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: <Widget>[
          Positioned(
            top: -30.h,
            right: -30.w,
            child: Container(
              width: 160.w,
              height: 160.w,
              decoration: const BoxDecoration(
                color: Color(0x0EFFFFFF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: -40.w,
            child: Container(
              width: 120.w,
              height: 120.w,
              decoration: const BoxDecoration(
                color: Color(0x08FFFFFF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.h),
                const DriverProfileHeaderTopRow(),
                SizedBox(height: 20.h),
                DriverProfileHeaderIdentityRow(profile: profile),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
