import 'package:equatable/equatable.dart';
import 'package:waterrush/core/utils/app_date_time.dart';

class ProfileOrderModel extends Equatable {
  const ProfileOrderModel({
    required this.id,
    required this.orderedAt,
    required this.totalPrice,
    required this.status,
    required this.itemsSummary,
    required this.deliveryType,
    required this.meta,
    required this.thumbnailAsset,
  });

  final String id;
  final DateTime orderedAt;
  final String totalPrice;
  final String status;
  final String itemsSummary;
  final String deliveryType;
  final String meta;
  final String thumbnailAsset;

  String get dateLabel =>
      AppDateTime.formatDateTime(orderedAt, pattern: 'MMMM dd, yyyy');

  @override
  List<Object?> get props => <Object?>[
    id,
    orderedAt,
    totalPrice,
    status,
    itemsSummary,
    deliveryType,
    meta,
    thumbnailAsset,
  ];
}