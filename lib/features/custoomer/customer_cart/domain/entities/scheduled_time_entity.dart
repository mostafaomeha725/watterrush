import 'package:equatable/equatable.dart';

class ScheduledTimeEntity extends Equatable {
  final int id;
  final String label;
  final String timeFrom;
  final String timeTo;

  const ScheduledTimeEntity({
    required this.id,
    required this.label,
    required this.timeFrom,
    required this.timeTo,
  });

  @override
  List<Object?> get props => [id, label, timeFrom, timeTo];
}
