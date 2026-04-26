import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_header_stats_row.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_header_top_row.dart';

class DeliverHomeHeaderSection extends StatelessWidget {
  const DeliverHomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Color(0xFF194E9D), Color(0xFF0D8AE3)],
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -34.h,
            right: -42.w,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0x14FFFFFF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 70.h,
            right: -16.w,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0x0FFFFFFF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 14.h),
              child: Column(
                children: <Widget>[
                  const DeliverHomeHeaderTopRow(),
                  verticalSpacing(12),
                  const DeliverHomeHeaderStatsRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
