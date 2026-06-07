import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_daily_summary_card.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_orders_header_row.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_order_card.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/delivery_progress_card.dart';

class DeliverHomeOrdersContentSection extends StatelessWidget {
  const DeliverHomeOrdersContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 104.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 16.h),
          DeliveryProgressCard(
            onTap: () {
              context.push(
                Routes.driverDeliveryDetailsScreen,
                extra: DeliverHomeDemoData.orders[1],
              );
            },
          ),
          verticalSpacing(20),
          const DeliverHomeOrdersHeaderRow(),
          verticalSpacing(12),
          ...DeliverHomeDemoData.orders.map(
            (DeliverOrderModel order) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: DeliverOrderCard(
                order: order,
                onTap: () {
                  context.push(
                    Routes.driverDeliveryDetailsScreen,
                    extra: order,
                  );
                },
              ),
            ),
          ),
          verticalSpacing(4),
          Row(
            children: <Widget>[
              Container(
                width: 4.w,
                height: 22.h,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0xFF1A6EE8), Color(0xFF0C52BC)],
                  ),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              horizontalSpacing(8),
              AppText(
                'Today\'s Summary',
                style: font18w700.copyWith(color: const Color(0xFF0B2650)),
              ),
            ],
          ),
          verticalSpacing(12),
          ...DeliverHomeDemoData.dailySummary.map(
            (DeliverDailySummaryModel summary) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: DeliverDailySummaryCard(summary: summary),
            ),
          ),
        ],
      ),
    );
  }
}
