import 'package:flutter/material.dart';
import 'orders_dummy_data.dart';

extension OrderStatusExtension on OrderStatus {
  Color get statusColor {
    switch (this) {
      case OrderStatus.pending:
        return const Color(0xFF6B58FA);
      case OrderStatus.inProgress:
        return const Color(0xFFF59E0B);
      case OrderStatus.onTheWay:
        return const Color(0xFF3B82F6);
      case OrderStatus.delivered:
        return const Color(0xFF10B981);
      case OrderStatus.cancelled:
        return const Color(0xFFEF4444);
    }
  }

  String get statusText {
    switch (this) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.inProgress:
        return 'In Progress';
      case OrderStatus.onTheWay:
        return 'On The Way';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  IconData get statusIcon {
    switch (this) {
      case OrderStatus.pending:
      case OrderStatus.onTheWay:
        return Icons.access_time_filled_rounded;
      case OrderStatus.inProgress:
        return Icons.cached_rounded;
      case OrderStatus.delivered:
        return Icons.check_circle_rounded;
      case OrderStatus.cancelled:
        return Icons.cancel_rounded;
    }
  }
}
