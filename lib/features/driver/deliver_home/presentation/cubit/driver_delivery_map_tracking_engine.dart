import 'dart:async';
import 'dart:math';

import 'package:latlong2/latlong.dart';

class DriverMapTrackingFrame {
  const DriverMapTrackingFrame({
    required this.position,
    required this.bearingRadians,
  });

  final LatLng position;
  final double bearingRadians;
}

class DriverDeliveryMapTrackingEngine {
  DriverDeliveryMapTrackingEngine({
    required this.onFrame,
    this.transitionDuration = const Duration(milliseconds: 1300),
    this.frameInterval = const Duration(milliseconds: 80),
  });

  final Duration transitionDuration;
  final Duration frameInterval;
  final void Function(DriverMapTrackingFrame) onFrame;
  static final Distance _distance = const Distance();

  Timer? _frameTimer;
  LatLng? _currentPosition;
  LatLng? _fromPosition;
  LatLng? _toPosition;
  Duration _elapsed = Duration.zero;
  double _bearingRadiansValue = 0;

  void start({required LatLng initialPosition}) {
    stop();
    _currentPosition = initialPosition;

    onFrame(
      DriverMapTrackingFrame(position: initialPosition, bearingRadians: 0),
    );
  }

  void animateTo(LatLng targetPosition) {
    final LatLng? current = _currentPosition;
    if (current == null) {
      start(initialPosition: targetPosition);
      return;
    }

    final double movementMeters = _distance.as(
      LengthUnit.Meter,
      current,
      targetPosition,
    );

    if (movementMeters < 1) {
      return;
    }

    _fromPosition = current;
    _toPosition = targetPosition;
    _elapsed = Duration.zero;
    _bearingRadiansValue = _bearingRadians(current, targetPosition);
    _ensureTimer();
  }

  void _ensureTimer() {
    _frameTimer ??= Timer.periodic(frameInterval, _onFrameTick);
  }

  void _onFrameTick(Timer timer) {
    final LatLng? from = _fromPosition;
    final LatLng? to = _toPosition;

    if (from == null || to == null) {
      _frameTimer?.cancel();
      _frameTimer = null;
      return;
    }

    _elapsed += frameInterval;

    final double t =
        (_elapsed.inMilliseconds / transitionDuration.inMilliseconds).clamp(
          0.0,
          1.0,
        );

    final LatLng interpolated = LatLng(
      _lerp(from.latitude, to.latitude, t),
      _lerp(from.longitude, to.longitude, t),
    );

    _currentPosition = interpolated;

    onFrame(
      DriverMapTrackingFrame(
        position: interpolated,
        bearingRadians: _bearingRadiansValue,
      ),
    );

    if (t >= 1) {
      _currentPosition = to;
      _fromPosition = null;
      _toPosition = null;
      _elapsed = Duration.zero;
    }
  }

  double _lerp(double a, double b, double t) => a + (b - a) * t;

  double _bearingRadians(LatLng from, LatLng to) {
    final double lat1 = from.latitude * pi / 180;
    final double lat2 = to.latitude * pi / 180;
    final double dLon = (to.longitude - from.longitude) * pi / 180;

    final double y = sin(dLon) * cos(lat2);
    final double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);

    return atan2(y, x);
  }

  void stop() {
    _frameTimer?.cancel();
    _frameTimer = null;
    _fromPosition = null;
    _toPosition = null;
    _elapsed = Duration.zero;
  }
}
