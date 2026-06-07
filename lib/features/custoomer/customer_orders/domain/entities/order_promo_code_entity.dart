import 'package:equatable/equatable.dart';

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
