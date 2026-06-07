import 'package:equatable/equatable.dart';

import 'order_status.dart';
import 'order_address_entity.dart';
import 'scheduled_time_entity.dart';
import 'order_promo_code_entity.dart';
import 'order_item_entity.dart';

export 'order_status.dart';
export 'order_address_entity.dart';
export 'scheduled_time_entity.dart';
export 'order_promo_code_entity.dart';
export 'order_item_entity.dart';

class CustomerOrderEntity extends Equatable {
  final int id;
  final OrderStatus status;
  final double total;
  final String deliveryDate;
  final String paymentMethod;
  final String createdAt;

  // Detailed fields (nullable because list endpoint doesn't return them)
  final double? subtotal;
  final double? deliveryFee;
  final String? notes;
  final OrderAddressEntity? address;
  final ScheduledTimeEntity? scheduledTime;
  final OrderPromoCodeEntity? promoCode;
  final List<OrderItemEntity>? items;

  const CustomerOrderEntity({
    required this.id,
    required this.status,
    required this.total,
    required this.deliveryDate,
    required this.paymentMethod,
    required this.createdAt,
    this.subtotal,
    this.deliveryFee,
    this.notes,
    this.address,
    this.scheduledTime,
    this.promoCode,
    this.items,
  });

  @override
  List<Object?> get props => [
    id,
    status,
    total,
    deliveryDate,
    paymentMethod,
    createdAt,
    subtotal,
    deliveryFee,
    notes,
    address,
    scheduledTime,
    promoCode,
    items,
  ];
}
