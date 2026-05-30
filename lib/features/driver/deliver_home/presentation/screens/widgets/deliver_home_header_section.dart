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
          bottomLeft: Radius.circular(34.r),
          bottomRight: Radius.circular(34.r),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Color(0xFF0C2461), Color(0xFF1464D8)],
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
            top: -28.h,
            right: -28.w,
            child: Container(
              width: 150.w,
              height: 150.w,
              decoration: const BoxDecoration(
                color: Color(0x10FFFFFF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -18.h,
            left: -18.w,
            child: Container(
              width: 110.w,
              height: 110.w,
              decoration: const BoxDecoration(
                color: Color(0x0BFFFFFF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 55.h,
            right: 90.w,
            child: Container(
              width: 55.w,
              height: 55.w,
              decoration: const BoxDecoration(
                color: Color(0x08FFFFFF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 18.h),
              child: Column(
                children: <Widget>[
                  const DeliverHomeHeaderTopRow(),
                  verticalSpacing(16),
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