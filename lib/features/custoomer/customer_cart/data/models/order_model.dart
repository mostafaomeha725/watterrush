import 'package:waterrush/features/custoomer/customer_cart/domain/entities/order_entity.dart';
import 'package:waterrush/features/custoomer/customer_cart/data/models/scheduled_time_model.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.status,
    required super.subtotal,
    required super.deliveryFee,
    required super.total,
    required super.paymentMethod,
    required super.deliveryDate,
    super.notes,
    super.address,
    super.scheduledTime,
    super.promoCode,
    required super.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as int? ?? 0,
      status: json['status'] ?? '',
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0.0,
      deliveryFee: (json['delivery_fee'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      paymentMethod: json['payment_method'] ?? '',
      deliveryDate: json['delivery_date'] ?? '',
      notes: json['notes'],
      address: json['address'] != null ? OrderAddressModel.fromJson(json['address']) : null,
      scheduledTime: json['scheduled_time'] != null ? ScheduledTimeModel.fromJson(json['scheduled_time']) : null,
      promoCode: json['promo_code'] != null ? OrderPromoCodeModel.fromJson(json['promo_code']) : null,
      items: json['items'] != null ? (json['items'] as List).map((i) => OrderItemModel.fromJson(i)).toList() : [],
    );
  }
}

class OrderAddressModel extends OrderAddressEntity {
  const OrderAddressModel({
    required super.id,
    required super.title,
    required super.address,
    required super.lat,
    required super.lng,
  });

  factory OrderAddressModel.fromJson(Map<String, dynamic> json) {
    return OrderAddressModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] ?? '',
      address: json['address'] ?? '',
      lat: json['lat']?.toString() ?? '',
      lng: json['lng']?.toString() ?? '',
    );
  }
}

class OrderPromoCodeModel extends OrderPromoCodeEntity {
  const OrderPromoCodeModel({
    required super.code,
    required super.type,
    required super.discount,
  });

  factory OrderPromoCodeModel.fromJson(Map<String, dynamic> json) {
    return OrderPromoCodeModel(
      code: json['code'] ?? '',
      type: json['type'] ?? '',
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class OrderItemModel extends OrderItemEntity {
  const OrderItemModel({
    required super.id,
    required super.productId,
    super.bundleId,
    required super.title,
    required super.price,
    required super.image,
    required super.quantity,
    required super.unitPrice,
    required super.subtotal,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'] as int? ?? 0,
      productId: json['product_id'] as int? ?? 0,
      bundleId: json['bundle_id'] as int?,
      title: json['title'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      image: json['image'] ?? '',
      quantity: json['quantity'] as int? ?? 0,
      unitPrice: (json['unit_price'] as num?)?.toDouble() ?? 0.0,
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
