import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/app_date_time.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/cubit/profile_order_history_cubit.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/cubit/profile_order_history_state.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_models.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_order_item_card.dart';

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
                  onPressed: () {
                    context
                        .read<ProfileOrderHistoryCubit>()
                        .toggleExpanded();
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
                          state.isExpanded
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: const Color(0xFF2E8CF5),
                          size: 24.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                if (state.isExpanded) ...<Widget>[
                  Divider(height: 1.h, color: const Color(0xFFE4ECF7)),
                  Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Column(
                      children: [
                        AppButton.icon(
                          text: state.selectedDate == null
                              ? 'Filter by Date'
                              : 'Date: ${AppDateTime.formatDateTime(state.selectedDate!, pattern: 'MMMM dd, yyyy')}',
                          onPressed: () {
                            context
                                .read<ProfileOrderHistoryCubit>()
                                .selectDateFilter(context);
                          },
                          color: const Color(0xFFEEF4FF),
                          textColor: const Color(0xFF2E4C74),
                          borderColor: const Color(0xFFD0DDF5),
                          radius: 14.r,
                          textSize: 12.sp,
                          textWeight: FontWeight.w600,
                          child: Icon(
                            Icons.calendar_month_rounded,
                            color: const Color(0xFF3F597D),
                            size: 18.sp,
                          ),
                        ),
                        if (state.selectedDate != null) ...<Widget>[
                          verticalSpacing(8),
                          AppButton.icon(
                            text: 'Clear Date Filter',
                            onPressed: () {
                              context
                                  .read<ProfileOrderHistoryCubit>()
                                  .clearDateFilter();
                            },
                            color: Colors.white,
                            textColor: const Color(0xFF6F8097),
                            borderColor: const Color(0xFFD1DCEC),
                            radius: 14.r,
                            textSize: 12.sp,
                            textWeight: FontWeight.w600,
                            child: Icon(
                              Icons.close_rounded,
                              color: const Color(0xFF6F8097),
                              size: 18.sp,
                            ),
                          ),
                        ],
                        verticalSpacing(10),
                        if (state.filteredOrders.isEmpty)
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F8FB),
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: const Color(0xFFE4ECF7),
                              ),
                            ),
                            child: AppText(
                              'No orders found for this date.',
                              style: font12w500.copyWith(
                                color: const Color(0xFF6F8097),
                              ),
                            ),
                          )
                        else
                          ...state.filteredOrders.map(
                            (ProfileOrderModel order) => Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: ProfileOrderItemCard(order: order),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
