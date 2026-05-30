import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/helpers/helpers.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/cubit/driver_delivery_map_tracking_cubit.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/cubit/driver_delivery_map_tracking_state.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_map_bottom_card.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_map_top_overlay.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_map_view.dart';

class DriverDeliveryMapBody extends StatefulWidget {
  const DriverDeliveryMapBody({super.key, required this.order});

  final DeliverOrderModel order;

  @override
  State<DriverDeliveryMapBody> createState() => _DriverDeliveryMapBodyState();
}

class _DriverDeliveryMapBodyState extends State<DriverDeliveryMapBody> {
  late final MapController _mapController;
  late final DriverDeliveryMapTrackingCubit _trackingCubit;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _trackingCubit = DriverDeliveryMapTrackingCubit(order: widget.order);
  }

  @override
  void dispose() {
    _trackingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DriverDeliveryMapTrackingCubit>.value(
      value: _trackingCubit,
      child:
          BlocConsumer<
            DriverDeliveryMapTrackingCubit,
            DriverDeliveryMapTrackingState
          >(
            listenWhen:
                (
                  DriverDeliveryMapTrackingState previous,
                  DriverDeliveryMapTrackingState current,
                ) =>
                    previous.driverPoint != current.driverPoint ||
                    previous.trackingErrorMessage !=
                        current.trackingErrorMessage,
            listener:
                (BuildContext context, DriverDeliveryMapTrackingState state) {
                  Helpers.moveMapControllerSafely(
                    mapController: _mapController,
                    location: state.driverPoint,
                    zoom: 15.3,
                  );

                  if (state.trackingErrorMessage != null) {
                    Helpers.showErrorSnack(
                      context: context,
                      message: state.trackingErrorMessage!,
                    );
                    context
                        .read<DriverDeliveryMapTrackingCubit>()
                        .clearTrackingErrorMessage();
                  }
                },
            builder:
                (BuildContext context, DriverDeliveryMapTrackingState state) {
                  return Container(
                    color: const Color(0xFFE6EEF8),
                    child: Stack(
                      children: <Widget>[
                        DriverDeliveryMapView(
                          mapController: _mapController,
                          driverPoint: state.driverPoint,
                          customerPoint: state.customerPoint,
                          remainingRoutePoints: state.remainingRoutePoints,
                          completedRoutePoints: state.completedRoutePoints,
                          driverBearingRadians: state.driverBearingRadians,
                        ),
                        Positioned.fill(
                          child: IgnorePointer(
                            child: Container(color: const Color(0x3A4F8ED6)),
                          ),
                        ),
                        SafeArea(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 10.h,
                            ),
                            child: DriverDeliveryMapTopOverlay(
                              order: state.order,
                              remainingEtaMinutes: state.remainingEtaMinutes,
                              remainingDistanceKm: state.remainingDistanceKm,
                              isCompleted: state.isCompleted,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: DriverDeliveryMapBottomCard(
                            order: state.order,
                          ),
                        ),
                      ],
                    ),
                  );
                },
          ),
    );
  }
}