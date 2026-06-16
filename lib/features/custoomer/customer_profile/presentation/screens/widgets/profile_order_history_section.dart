import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';

import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/cubit/profile_order_history_cubit.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/cubit/profile_order_history_state.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_models.dart';
import 'package:waterrush/core/widgets/custom_nav_bar.dart';

class ProfileOrderHistorySection extends StatelessWidget {
  const ProfileOrderHistorySection({super.key, required this.orders});

  final List<ProfileOrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileOrderHistoryCubit>(
      create: (_) => ProfileOrderHistoryCubit(orders: orders),
      child: BlocBuilder<ProfileOrderHistoryCubit, ProfileOrderHistoryState>(
        builder: (BuildContext context, ProfileOrderHistoryState state) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BounceIt(
                  onPressed: () async {
                    final result = await context.push(Routes.customerOrdersScreen);
                    if (result == 'go_to_cart_tab' && context.mounted) {
                      CustomNavBar.switchToTab(context, 2);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 14.h,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEEF4FF),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(
                            Icons.receipt_long_outlined,
                            size: 20.sp,
                            color: const Color(0xFF2E8CF5),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: AppText(
                            state.isExpanded
                                ? 'Hide Order History'
                                : 'Show Order History',
                            style: font14w700.copyWith(
                              color: const Color(0xFF0F2B46),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: const Color(0xFF2E8CF5),
                          size: 24.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                // Removed expanded section as per new requirement to open dedicated screen
              ],
            ),
          );
        },
      ),
    );
  }
}
