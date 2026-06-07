import 'package:waterrush/core/constants/app_assets.dart';

class DriverProfileData {
  const DriverProfileData({
    required this.name,
    required this.phone,
    required this.rating,
    required this.todayRuns,
    required this.todayRating,
    required this.todayEarned,
    required this.totalDeliveries,
    required this.avgRating,
    required this.onTimeRate,
    required this.cashCollected,
    required this.vehicleModel,
    required this.plateNumber,
    required this.avatarAsset,
  });

  final String name;
  final String phone;
  final String rating;
  final String todayRuns;
  final String todayRating;
  final String todayEarned;
  final String totalDeliveries;
  final String avgRating;
  final String onTimeRate;
  final String cashCollected;
  final String vehicleModel;
  final String plateNumber;
  final String avatarAsset;
}

class DriverProfileDemoData {
  DriverProfileDemoData._();

  static const DriverProfileData profile = DriverProfileData(
    name: 'Kareem Salah',
    phone: '+20 101 234 5678',
    rating: '4.9',
    todayRuns: '7',
    todayRating: '4.9',
    todayEarned: '380',
    totalDeliveries: '1,284',
    avgRating: '4.9',
    onTimeRate: '99%',
    cashCollected: 'EGP 2,450',
    vehicleModel: 'Toyota Hilux 2023',
    plateNumber: 'A B C    1 2 3 4',
    avatarAsset: Assets.test,
  );
}
