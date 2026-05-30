import 'package:latlong2/latlong.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';

class DriverDeliveryMapMockGps {
  DriverDeliveryMapMockGps._();

  // Replace this mock builder with live GPS stream points from backend/device.
  static List<LatLng> buildRoute(DeliverOrderModel order) {
    final LatLng start = LatLng(order.driverLat, order.driverLng);
    final LatLng pickup = LatLng(order.pickupLat, order.pickupLng);
    final LatLng customer = LatLng(order.customerLat, order.customerLng);

    return <LatLng>[
      start,
      ..._segmentWithCurve(
        from: start,
        to: pickup,
        steps: 5,
        latOffsetFactor: 0.0010,
        lngOffsetFactor: -0.0007,
      ),
      pickup,
      ..._segmentWithCurve(
        from: pickup,
        to: customer,
        steps: 8,
        latOffsetFactor: -0.0012,
        lngOffsetFactor: 0.0010,
      ),
      customer,
    ];
  }

  static List<LatLng> _segmentWithCurve({
    required LatLng from,
    required LatLng to,
    required int steps,
    required double latOffsetFactor,
    required double lngOffsetFactor,
  }) {
    final List<LatLng> points = <LatLng>[];

    for (int i = 1; i < steps; i++) {
      final double t = i / steps;
      final double bend = (t * (1 - t)) * 4;
      final double lat =
          from.latitude +
          (to.latitude - from.latitude) * t +
          (latOffsetFactor * bend);
      final double lng =
          from.longitude +
          (to.longitude - from.longitude) * t +
          (lngOffsetFactor * bend);

      points.add(LatLng(lat, lng));
    }

    return points;
  }
}