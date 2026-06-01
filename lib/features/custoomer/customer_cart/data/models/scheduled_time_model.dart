import 'package:waterrush/features/custoomer/customer_cart/domain/entities/scheduled_time_entity.dart';

class ScheduledTimeModel extends ScheduledTimeEntity {
  const ScheduledTimeModel({
    required super.id,
    required super.label,
    required super.timeFrom,
    required super.timeTo,
  });

  factory ScheduledTimeModel.fromJson(Map<String, dynamic> json) {
    return ScheduledTimeModel(
      id: json['id'] as int? ?? 0,
      label: json['label'] ?? '',
      timeFrom: json['time_from'] ?? '',
      timeTo: json['time_to'] ?? '',
    );
  }
}
