import 'package:waterrush/features/custoomer/customer_orders/domain/entities/order_promo_code_entity.dart';

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
      discount: json['discount'] is num
          ? (json['discount'] as num).toDouble()
          : double.tryParse(json['discount'].toString()) ?? 0.0,
    );
  }
}
