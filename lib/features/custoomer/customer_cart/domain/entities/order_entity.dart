import 'package:equatable/equatable.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/entities/scheduled_time_entity.dart';

class OrderEntity extends Equatable {
  final int id;
  final String status;
  final double subtotal;
  final double deliveryFee;
  final double total;
  final String paymentMethod;
  final String deliveryDate;
  final String? notes;
  final OrderAddressEntity? address;
  final ScheduledTimeEntity? scheduledTime;
  final OrderPromoCodeEntity? promoCode;
  final List<OrderItemEntity> items;

  const OrderEntity({
    required this.id,
    required this.status,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.paymentMethod,
    required this.deliveryDate,
    this.notes,
    this.address,
    this.scheduledTime,
    this.promoCode,
    required this.items,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        subtotal,
        deliveryFee,
        total,
        paymentMethod,
        deliveryDate,
        notes,
        address,
        scheduledTime,
        promoCode,
        items,
      ];
}

class OrderAddressEntity extends Equatable {
  final int id;
  final String title;
  final String address;
  final String lat;
  final String lng;

  const OrderAddressEntity({
    required this.id,
    required this.title,
    required this.address,
    required this.lat,
    required this.lng,
  });

  @override
  List<Object?> get props => [id, title, address, lat, lng];
}

class OrderPromoCodeEntity extends Equatable {
  final String code;
  final String type;
  final double discount;

  const OrderPromoCodeEntity({
    required this.code,
    required this.type,
    required this.discount,
  });

  @override
  List<Object?> get props => [code, type, discount];
}

class OrderItemEntity extends Equatable {
  final int id;
  final int productId;
  final int? bundleId;
  final String title;
  final double price;
  final String image;
  final int quantity;
  final double unitPrice;
  final double subtotal;

  const OrderItemEntity({
    required this.id,
    required this.productId,
    this.bundleId,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
    required this.unitPrice,
    required this.subtotal,
  });

  @override
  List<Object?> get props => [
        id,
        productId,
        bundleId,
        title,
        price,
        image,
        quantity,
        unitPrice,
        subtotal,
      ];
}
