import 'package:flutter/material.dart';
import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';

extension OrderStatusExtension on OrderStatus {
  Color get statusColor {
    switch (this) {
      case OrderStatus.pending:
        return const Color(0xFF6B58FA);
      case OrderStatus.inProgress:
        return const Color(0xFF0B48C6);
      case OrderStatus.onTheWay:
        return const Color(0xFF1BA78F);
      case OrderStatus.delivered:
        return const Color(0xFF04A85A);
      case OrderStatus.cancelled:
        return const Color(0xFFCE1126);
    }
  }

  Color get statusBgColor {
    switch (this) {
      case OrderStatus.pending:
        return const Color(0xFFF8F6FF);
      case OrderStatus.inProgress:
        return const Color(0xFFF3F7FF);
      case OrderStatus.onTheWay:
        return const Color(0xFFEFFFFA);
      case OrderStatus.delivered:
        return const Color(0xFFECFDF5);
      case OrderStatus.cancelled:
        return const Color(0xFFFFF0F1);
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

  String get statusImage {
    switch (this) {
      case OrderStatus.pending:
        return 'assets/pending.png';
      case OrderStatus.inProgress:
        return 'assets/in progress.png';
      case OrderStatus.onTheWay:
        return 'assets/on the way.png';
      case OrderStatus.delivered:
        return 'assets/delivered.png';
      case OrderStatus.cancelled:
        return 'assets/canceled.png';
    }
  }

  String get statusSubtitle {
    switch (this) {
      case OrderStatus.pending:
        return 'We\'ve received your order and will update you soon.';
      case OrderStatus.inProgress:
        return 'Your order is being prepared and will be on its way soon.';
      case OrderStatus.onTheWay:
        return 'Great news! Your order is on the way and will reach you soon.';
      case OrderStatus.delivered:
        return 'Your order has been delivered successfully. Thank you for shopping with us!';
      case OrderStatus.cancelled:
        return 'This order has been cancelled.\nIf you have any questions, please contact our support team.';
    }
  }
}
