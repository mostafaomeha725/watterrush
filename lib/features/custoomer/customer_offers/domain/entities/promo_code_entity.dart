import 'package:equatable/equatable.dart';

class PromoCodeEntity extends Equatable {
  final int id;
  final String code;
  final String type;
  final num discount;
  final String expiresAt;

  const PromoCodeEntity({
    required this.id,
    required this.code,
    required this.type,
    required this.discount,
    required this.expiresAt,
  });

  @override
  List<Object?> get props => [id, code, type, discount, expiresAt];
}
