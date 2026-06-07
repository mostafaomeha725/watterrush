import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/core/usecase/base_usecase.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/entities/order_entity.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/repositories/cart_repository.dart';

class PlaceOrderUseCase implements UseCase<OrderEntity, PlaceOrderParams> {
  final CartRepository repository;

  PlaceOrderUseCase(this.repository);

  @override
  Future<Either<Failure, OrderEntity>> call(PlaceOrderParams params) async {
    return await repository.placeOrder(params);
  }
}

class PlaceOrderParams extends Equatable {
  final int addressId;
  final String deliveryDate;
  final int scheduledTimeId;
  final String paymentMethod;
  final String? promoCode;
  final String? notes;

  const PlaceOrderParams({
    required this.addressId,
    required this.deliveryDate,
    required this.scheduledTimeId,
    required this.paymentMethod,
    this.promoCode,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'address_id': addressId,
      'delivery_date': deliveryDate,
      'scheduled_time_id': scheduledTimeId,
      'payment_method': paymentMethod,
    };
    if (promoCode != null && promoCode!.isNotEmpty) {
      data['promo_code'] = promoCode;
    }
    if (notes != null && notes!.isNotEmpty) {
      data['notes'] = notes;
    }
    return data;
  }

  @override
  List<Object?> get props => [
    addressId,
    deliveryDate,
    scheduledTimeId,
    paymentMethod,
    promoCode,
    notes,
  ];
}
