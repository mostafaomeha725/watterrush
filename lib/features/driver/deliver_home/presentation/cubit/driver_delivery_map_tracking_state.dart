import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';

class DriverDeliveryMapTrackingState extends Equatable {
  const DriverDeliveryMapTrackingState({
    required this.order,
    required this.driverPoint,
    required this.customerPoint,
    required this.driverBearingRadians,
    required this.remainingRoutePoints,
    required this.completedRoutePoints,
    required this.remainingDistanceKm,
    required this.remainingEtaMinutes,
    required this.isCompleted,
    required this.isTrackingActive,
    required this.isLocationServiceEnabled,
    required this.hasLocationPermission,
    this.trackingErrorMessage,
  });

  final DeliverOrderModel order;
  final LatLng driverPoint;
  final LatLng customerPoint;
  final double driverBearingRadians;
  final List<LatLng> remainingRoutePoints;
  final List<LatLng> completedRoutePoints;
  final double remainingDistanceKm;
  final int remainingEtaMinutes;
  final bool isCompleted;
  final bool isTrackingActive;
  final bool isLocationServiceEnabled;
  final bool hasLocationPermission;
  final String? trackingErrorMessage;

  DriverDeliveryMapTrackingState copyWith({
    DeliverOrderModel? order,
    LatLng? driverPoint,
    LatLng? customerPoint,
    double? driverBearingRadians,
    List<LatLng>? remainingRoutePoints,
    List<LatLng>? completedRoutePoints,
    double? remainingDistanceKm,
    int? remainingEtaMinutes,
    bool? isCompleted,
    bool? isTrackingActive,
    bool? isLocationServiceEnabled,
    bool? hasLocationPermission,
    String? trackingErrorMessage,
    bool clearTrackingErrorMessage = false,
  }) {
    return DriverDeliveryMapTrackingState(
      order: order ?? this.order,
      driverPoint: driverPoint ?? this.driverPoint,
      customerPoint: customerPoint ?? this.customerPoint,
      driverBearingRadians: driverBearingRadians ?? this.driverBearingRadians,
      remainingRoutePoints: remainingRoutePoints ?? this.remainingRoutePoints,
      completedRoutePoints: completedRoutePoints ?? this.completedRoutePoints,
      remainingDistanceKm: remainingDistanceKm ?? this.remainingDistanceKm,
      remainingEtaMinutes: remainingEtaMinutes ?? this.remainingEtaMinutes,
      isCompleted: isCompleted ?? this.isCompleted,
      isTrackingActive: isTrackingActive ?? this.isTrackingActive,
      isLocationServiceEnabled:
          isLocationServiceEnabled ?? this.isLocationServiceEnabled,
      hasLocationPermission:
          hasLocationPermission ?? this.hasLocationPermission,
      trackingErrorMessage: clearTrackingErrorMessage
          ? null
          : (trackingErrorMessage ?? this.trackingErrorMessage),
    );
  }

  @override
  List<Object?> get props => <Object?>[
    order,
    driverPoint,
    customerPoint,
    driverBearingRadians,
    remainingRoutePoints,
    completedRoutePoints,
    remainingDistanceKm,
    remainingEtaMinutes,
    isCompleted,
    isTrackingActive,
    isLocationServiceEnabled,
    hasLocationPermission,
    trackingErrorMessage,
  ];
}