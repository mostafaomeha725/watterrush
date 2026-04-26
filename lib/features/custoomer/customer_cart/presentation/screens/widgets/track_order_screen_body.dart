import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/helpers/helpers.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/track_order_courier_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/track_order_driver_eta_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/track_order_header.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/track_order_help_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/track_order_items_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/track_order_map_overview_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/track_order_status_timeline.dart';

class TrackOrderScreenBody extends StatelessWidget {
  const TrackOrderScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(22.w, 10.h, 22.w, 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrackOrderHeader(onBackTap: context.pop),
            verticalSpacing(12),
            const TrackOrderMapOverviewCard(),
            verticalSpacing(10),
            TrackOrderDriverEtaCard(
              onChatTap: () {
                Helpers.proceedToSupportChat(context: context);
              },
            ),
            verticalSpacing(10),
            const TrackOrderCourierCard(),
            verticalSpacing(14),
            const TrackOrderStatusTimeline(),
            verticalSpacing(14),
            const TrackOrderItemsCard(),
            verticalSpacing(14),
            TrackOrderHelpCard(
              onChatTap: () {
                Helpers.proceedToSupportChat(context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
