import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/cubit/driver_delivery_details_cubit.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/cubit/driver_delivery_details_state.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_bottom_actions.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_customer_card.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_details_header.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_items_card.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_map_card.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_reject_sheet.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_timeline_card.dart';

class DriverDeliveryDetailsBody extends StatelessWidget {
  const DriverDeliveryDetailsBody({super.key, required this.order});

  final DeliverOrderModel order;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DriverDeliveryDetailsCubit>(
      create: (_) => DriverDeliveryDetailsCubit(order: order),
      child:
          BlocBuilder<DriverDeliveryDetailsCubit, DriverDeliveryDetailsState>(
            builder: (BuildContext context, DriverDeliveryDetailsState state) {
              return Container(
                color: const Color(0xFFEEF1F9),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            DriverDeliveryDetailsHeader(state: state),
                            SizedBox(height: 16.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22.w),
                              child: Column(
                                children: <Widget>[
                                  DriverDeliveryTimelineCard(state: state),
                                  SizedBox(height: 10.h),
                                  DriverDeliveryCustomerCard(
                                    order: state.order,
                                  ),
                                  SizedBox(height: 10.h),
                                  DriverDeliveryItemsCard(order: state.order),
                                  SizedBox(height: 10.h),
                                  DriverDeliveryMapCard(order: state.order),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DriverDeliveryBottomActions(
                      state: state,
                      onBackTap: context.pop,
                      onRejectTap: state.canReject
                          ? () async {
                              final DriverDeliveryDetailsCubit cubit = context
                                  .read<DriverDeliveryDetailsCubit>();
                              cubit.resetRejectSelection();
                              await showModalBottomSheet<void>(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (_) {
                                  return BlocProvider<
                                    DriverDeliveryDetailsCubit
                                  >.value(
                                    value: cubit,
                                    child: const DriverDeliveryRejectSheet(),
                                  );
                                },
                              );
                            }
                          : null,
                      onPrimaryTap: () {
                        final DriverDeliveryDetailsCubit cubit = context
                            .read<DriverDeliveryDetailsCubit>();
                        final bool shouldOpenSuccess =
                            state.stage == DriverDeliveryStage.onTheWay;

                        cubit.moveToNextStage();

                        if (shouldOpenSuccess) {
                          context.push(
                            Routes.driverDeliverySuccessScreen,
                            extra: state.order,
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
    );
  }
}
