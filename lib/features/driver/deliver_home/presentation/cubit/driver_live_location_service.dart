import 'dart:async';
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class DriverLiveLocationStatus {
  const DriverLiveLocationStatus({
    required this.serviceEnabled,
    required this.permissionGranted,
    this.message,
  });

  final bool serviceEnabled;
  final bool permissionGranted;
  final String? message;

  bool get isReady => serviceEnabled && permissionGranted;
}

class DriverLiveLocationService {
  static const Duration _defaultInterval = Duration(seconds: 2);

  Future<DriverLiveLocationStatus> prepareForTracking() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const DriverLiveLocationStatus(
        serviceEnabled: false,
        permissionGranted: false,
        message: 'Location service is disabled. Please enable GPS.',
      );
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      return const DriverLiveLocationStatus(
        serviceEnabled: true,
        permissionGranted: false,
        message: 'Location permission denied. Please allow location access.',
      );
    }

    if (permission == LocationPermission.deniedForever) {
      return const DriverLiveLocationStatus(
        serviceEnabled: true,
        permissionGranted: false,
        message:
            'Location permission denied forever. Enable it from app settings.',
      );
    }

    return const DriverLiveLocationStatus(
      serviceEnabled: true,
      permissionGranted: true,
    );
  }

  Future<LatLng?> getCurrentPoint() async {
    final Position? cached = await Geolocator.getLastKnownPosition();
    if (cached != null) {
      return LatLng(cached.latitude, cached.longitude);
    }

    final Position current = await Geolocator.getCurrentPosition(
      locationSettings: _buildSettings(interval: _defaultInterval),
    );

    return LatLng(current.latitude, current.longitude);
  }

  Stream<LatLng> livePositionStream({Duration? interval}) {
    final LocationSettings settings = _buildSettings(
      interval: interval ?? _defaultInterval,
    );

    // Replace this device stream with Firebase stream when tracking another phone.
    return Geolocator.getPositionStream(
      locationSettings: settings,
    ).map((Position position) => LatLng(position.latitude, position.longitude));
  }

  LocationSettings _buildSettings({required Duration interval}) {
    if (Platform.isAndroid) {
      return AndroidSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 3,
        intervalDuration: interval,
      );
    }

    if (Platform.isIOS || Platform.isMacOS) {
      return AppleSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 3,
      );
    }

    return const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 3,
    );
  }
}
