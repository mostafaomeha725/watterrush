import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/di/services_locator.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_icon_action.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_address_selector.dart';

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
    return BlocProvider(
      create: (context) => sl<AddressCubit>(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Icon(
                    Icons.place_rounded,
                    color: const Color(0xFF0b48c6),
                    size: 18.sp,
                  ),
                ),
                SizedBox(width: 6.w),
                const CustomerHomeAddressSelector(),
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
      ),
    );
  }
}
