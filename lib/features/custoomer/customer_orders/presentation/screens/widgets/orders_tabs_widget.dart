import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/cubit/customer_orders_cubit.dart';
import 'package:waterrush/features/custoomer/customer_orders/presentation/cubit/customer_orders_state.dart';

class OrdersTabsWidget extends StatelessWidget {
  final List<String> tabs = [
    'All',
    'Pending',
    'In Progress',
    'Delivered',
    'Cancelled',
  ];

  OrdersTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerOrdersCubit, CustomerOrdersState>(
      builder: (context, state) {
        final selectedIndex = context
            .read<CustomerOrdersCubit>()
            .selectedTabIndex;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(tabs.length, (index) {
              final isSelected = index == selectedIndex;
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: BounceIt(
                  onPressed: () {
                    context.read<CustomerOrdersCubit>().changeTab(index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF5D52FA)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      border: isSelected
                          ? Border.all(color: Colors.transparent)
                          : Border.all(color: const Color(0xFFF3F4F6)),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: const Color(0xFF5D52FA).withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                    child: AppText(
                      tabs[index],
                      style: font14w500.copyWith(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF6B7280),
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
