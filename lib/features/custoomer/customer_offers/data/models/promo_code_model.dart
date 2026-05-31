import 'package:waterrush/features/custoomer/customer_offers/domain/entities/promo_code_entity.dart';

class PromoCodeModel extends PromoCodeEntity {
  const PromoCodeModel({
    required super.id,
    required super.code,
    required super.type,
    required super.discount,
    required super.expiresAt,
  });

  factory PromoCodeModel.fromJson(Map<String, dynamic> json) {
    return PromoCodeModel(
      id: json['id'],
      code: json['code'],
      type: json['type'],
      discount: json['discount'],
      expiresAt: json['expires_at'],
    );
  }
}
