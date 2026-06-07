import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/cubit/driver_delivery_map_tracking_engine.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/cubit/driver_delivery_map_tracking_state.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/cubit/driver_live_location_service.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';

class DriverDeliveryMapTrackingCubit
    extends Cubit<DriverDeliveryMapTrackingState> {
  DriverDeliveryMapTrackingCubit({
    required DeliverOrderModel order,
    DriverLiveLocationService? locationService,
    Stream<LatLng>? customerLiveStream,
  }) : _order = order,
       _locationService = locationService ?? DriverLiveLocationService(),
       super(_buildInitialState(order)) {
    _engine = DriverDeliveryMapTrackingEngine(onFrame: _onTrackingFrame);
    if (customerLiveStream != null) {
      _customerLocationSubscription = customerLiveStream.listen(
        _onCustomerPointUpdated,
      );
    }
    unawaited(_startLiveTracking());
  }

  final DeliverOrderModel _order;
  final DriverLiveLocationService _locationService;
  late final DriverDeliveryMapTrackingEngine _engine;
  StreamSubscription<LatLng>? _locationSubscription;
  StreamSubscription<LatLng>? _customerLocationSubscription;

  static final Distance _distance = const Distance();

  static DriverDeliveryMapTrackingState _buildInitialState(
    DeliverOrderModel order,
  ) {
    final LatLng initialPoint = LatLng(order.driverLat, order.driverLng);
    final LatLng customerPoint = LatLng(order.customerLat, order.customerLng);
    final List<LatLng> initialRoute = _buildRemainingRoute(
      initialPoint,
      customerPoint,
    );
    final double initialDistance = _calculateDistanceKm(initialRoute);

    return DriverDeliveryMapTrackingState(
      order: order,
      driverPoint: initialPoint,
      customerPoint: customerPoint,
      driverBearingRadians: 0,
      remainingRoutePoints: initialRoute,
      completedRoutePoints: <LatLng>[initialPoint],
      remainingDistanceKm: initialDistance,
      remainingEtaMinutes: _calculateEtaMinutes(initialDistance),
      isCompleted: false,
      isTrackingActive: false,
      isLocationServiceEnabled: true,
      hasLocationPermission: true,
    );
  }

  Future<void> _startLiveTracking() async {
    final DriverLiveLocationStatus status = await _locationService
        .prepareForTracking();

    if (!status.isReady) {
      emit(
        state.copyWith(
          isTrackingActive: false,
          isLocationServiceEnabled: status.serviceEnabled,
          hasLocationPermission: status.permissionGranted,
          trackingErrorMessage: status.message,
        ),
      );
      return;
    }

    final LatLng fallbackPoint = LatLng(_order.driverLat, _order.driverLng);
    LatLng initialPoint = fallbackPoint;

    try {
      final LatLng? currentPoint = await _locationService.getCurrentPoint();
      if (currentPoint != null) {
        initialPoint = currentPoint;
      }
    } catch (_) {
      emit(
        state.copyWith(
          trackingErrorMessage:
              'Could not resolve current location. Tracking started from fallback point.',
        ),
      );
    }

    _engine.start(initialPosition: initialPoint);
    _emitTrackingState(
      point: initialPoint,
      bearingRadians: state.driverBearingRadians,
      isTrackingActive: true,
    );

    _locationSubscription = _locationService.livePositionStream().listen(
      _engine.animateTo,
      onError: (_) {
        emit(
          state.copyWith(
            isTrackingActive: false,
            trackingErrorMessage:
                'Live location updates stopped. Please check GPS connection.',
          ),
        );
      },
    );
  }

  void _onTrackingFrame(DriverMapTrackingFrame frame) {
    _emitTrackingState(
      point: frame.position,
      bearingRadians: frame.bearingRadians,
      isTrackingActive: true,
    );
  }

  void _emitTrackingState({
    required LatLng point,
    required double bearingRadians,
    required bool isTrackingActive,
  }) {
    final List<LatLng> remaining = _buildRemainingRoute(
      point,
      state.customerPoint,
    );
    final List<LatLng> completed = _appendCompletedPoint(
      state.completedRoutePoints,
      point,
    );

    final double remainingDistanceKm = _calculateDistanceKm(remaining);
    final bool arrived = remainingDistanceKm <= 0.03;

    emit(
      state.copyWith(
        driverPoint: point,
        driverBearingRadians: bearingRadians,
        completedRoutePoints: completed,
        remainingRoutePoints: remaining,
        remainingDistanceKm: remainingDistanceKm,
        remainingEtaMinutes: _calculateEtaMinutes(remainingDistanceKm),
        isCompleted: arrived,
        isTrackingActive: isTrackingActive,
        isLocationServiceEnabled: true,
        hasLocationPermission: true,
      ),
    );
  }

  void _onCustomerPointUpdated(LatLng customerPoint) {
    final List<LatLng> remaining = _buildRemainingRoute(
      state.driverPoint,
      customerPoint,
    );
    final double remainingDistanceKm = _calculateDistanceKm(remaining);

    emit(
      state.copyWith(
        customerPoint: customerPoint,
        remainingRoutePoints: remaining,
        remainingDistanceKm: remainingDistanceKm,
        remainingEtaMinutes: _calculateEtaMinutes(remainingDistanceKm),
        isCompleted: remainingDistanceKm <= 0.03,
      ),
    );
  }

  static List<LatLng> _buildRemainingRoute(LatLng current, LatLng customer) {
    return <LatLng>[current, customer];
  }

  static List<LatLng> _appendCompletedPoint(List<LatLng> points, LatLng next) {
    if (points.isEmpty) {
      return <LatLng>[next];
    }

    final LatLng last = points.last;
    final double distanceMeters = _distance.as(LengthUnit.Meter, last, next);
    if (distanceMeters < 0.5) {
      return points;
    }

    return <LatLng>[...points, next];
  }

  static double _calculateDistanceKm(List<LatLng> points) {
    if (points.length < 2) return 0;

    double total = 0;
    for (int i = 0; i < points.length - 1; i++) {
      total += _distance.as(LengthUnit.Kilometer, points[i], points[i + 1]);
    }

    return total;
  }

  static int _calculateEtaMinutes(double remainingDistanceKm) {
    const double averageSpeedKmH = 26;
    final int minutes = ((remainingDistanceKm / averageSpeedKmH) * 60).round();
    return minutes < 1 ? 1 : minutes;
  }

  void clearTrackingErrorMessage() {
    if (state.trackingErrorMessage == null) {
      return;
    }

    emit(state.copyWith(clearTrackingErrorMessage: true));
  }

  @override
  Future<void> close() async {
    await _locationSubscription?.cancel();
    await _customerLocationSubscription?.cancel();
    _engine.stop();
    await super.close();
  }
}
