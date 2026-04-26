import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_icon_action.dart';

class CustomerHomeTopBar extends StatelessWidget {
  const CustomerHomeTopBar({
    required this.onNotificationTap,
    required this.onProfileTap,
    super.key,
  });

  final VoidCallback onNotificationTap;
  final VoidCallback onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Icon(
                  Icons.place_rounded,
                  color: const Color(0xFF0b48c6),
                  size: 18.sp,
                ),
              ),
              SizedBox(width: 6.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Deliver to',
                    style: font8w600.copyWith(color: const Color(0xFF7E8EA8)),
                  ),
                  Row(
                    children: [
                      AppText(
                        'Nasr City, Cairo',
                        style: font12w800.copyWith(
                          color: const Color(0xFF24385B),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 14.sp,
                        color: const Color(0xFF6F84A6),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        CustomerHomeIconAction(
          icon: Icons.notifications_none_rounded,
          badgeCount: 1,
          onTap: onNotificationTap,
        ),
        SizedBox(width: 6.w),
        CustomerHomeIconAction(
          icon: Icons.person_outline_rounded,
          onTap: onProfileTap,
        ),
      ],
    );
  }
}
