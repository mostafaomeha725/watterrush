import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class DriverDeliveryMapView extends StatelessWidget {
  const DriverDeliveryMapView({
    super.key,
    required this.mapController,
    required this.driverPoint,
    required this.customerPoint,
    required this.remainingRoutePoints,
    required this.completedRoutePoints,
    required this.driverBearingRadians,
  });

  final MapController mapController;
  final LatLng driverPoint;
  final LatLng customerPoint;
  final List<LatLng> remainingRoutePoints;
  final List<LatLng> completedRoutePoints;
  final double driverBearingRadians;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: driverPoint,
        initialZoom: 14,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
        ),
      ),
      children: <Widget>[
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.waterrush.app',
        ),
        PolylineLayer(
          polylines: <Polyline>[
            if (completedRoutePoints.length > 1)
              Polyline(
                points: completedRoutePoints,
                strokeWidth: 6.w,
                color: const Color(0xFF1AB57B),
              ),
            if (remainingRoutePoints.length > 1)
              Polyline(
                points: remainingRoutePoints,
                strokeWidth: 7.w,
                color: const Color(0xFF1D6FD7),
              ),
          ],
        ),
        MarkerLayer(
          markers: <Marker>[
            Marker(
              point: customerPoint,
              width: 12.w,
              height: 12.h,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF1AB57B),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Marker(
              point: driverPoint,
              width: 60.w,
              height: 60.h,
              child: Transform.rotate(
                angle: driverBearingRadians,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFBFD4EE),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 38.w,
                      height: 38.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF1E6FD8),
                      ),
                      child: Icon(
                        Icons.directions_car_filled_rounded,
                        color: const Color(0xFFE53A3A),
                        size: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}