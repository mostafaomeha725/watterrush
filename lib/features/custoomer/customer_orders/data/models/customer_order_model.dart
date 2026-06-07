import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';
import 'order_address_model.dart';
import 'scheduled_time_model.dart';
import 'order_promo_code_model.dart';
import 'order_item_model.dart';

class CustomerOrderModel extends CustomerOrderEntity {
  const CustomerOrderModel({
    required super.id,
    required super.status,
    required super.total,
    required super.deliveryDate,
    required super.paymentMethod,
    required super.createdAt,
    super.subtotal,
    super.deliveryFee,
    super.notes,
    super.address,
    super.scheduledTime,
    super.promoCode,
    super.items,
  });

  factory CustomerOrderModel.fromJson(Map<String, dynamic> json) {
    return CustomerOrderModel(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id'].toString()) ?? 0,
      status: getOrderStatusFromString(json['status'] ?? ''),
      total: json['total'] is num
          ? (json['total'] as num).toDouble()
          : double.tryParse(json['total'].toString()) ?? 0.0,
      deliveryDate: json['delivery_date'] ?? '',
      paymentMethod: json['payment_method'] ?? '',
      createdAt:
          json['created_at'] ??
          (json['delivery_date'] ??
              ''), // The list API had created_at, details has delivery_date
      subtotal: json['subtotal'] is num
          ? (json['subtotal'] as num).toDouble()
          : double.tryParse(json['subtotal']?.toString() ?? ''),
      deliveryFee: json['delivery_fee'] is num
          ? (json['delivery_fee'] as num).toDouble()
          : double.tryParse(json['delivery_fee']?.toString() ?? ''),
      notes: json['notes'],
      address: json['address'] != null
          ? OrderAddressModel.fromJson(json['address'])
          : null,
      scheduledTime: json['scheduled_time'] != null
          ? ScheduledTimeModel.fromJson(json['scheduled_time'])
          : null,
      promoCode: json['promo_code'] != null
          ? OrderPromoCodeModel.fromJson(json['promo_code'])
          : null,
      items: json['items'] != null
          ? (json['items'] as List)
                .map((i) => OrderItemModel.fromJson(i))
                .toList()
          : null,
    );
  }
}
