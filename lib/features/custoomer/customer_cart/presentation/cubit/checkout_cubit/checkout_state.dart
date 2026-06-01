import 'package:equatable/equatable.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/entities/order_entity.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/entities/scheduled_time_entity.dart';

enum CheckoutStatus { initial, loading, success, failure }

class CheckoutState extends Equatable {
  final CheckoutStatus scheduledTimesStatus;
  final List<ScheduledTimeEntity> scheduledTimes;
  final String scheduledTimesMessage;

  final CheckoutStatus placeOrderStatus;
  final OrderEntity? placedOrder;
  final String placeOrderMessage;

  const CheckoutState({
    this.scheduledTimesStatus = CheckoutStatus.initial,
    this.scheduledTimes = const [],
    this.scheduledTimesMessage = '',
    this.placeOrderStatus = CheckoutStatus.initial,
    this.placedOrder,
    this.placeOrderMessage = '',
  });

  CheckoutState copyWith({
    CheckoutStatus? scheduledTimesStatus,
    List<ScheduledTimeEntity>? scheduledTimes,
    String? scheduledTimesMessage,
    CheckoutStatus? placeOrderStatus,
    OrderEntity? placedOrder,
    String? placeOrderMessage,
  }) {
    return CheckoutState(
      scheduledTimesStatus: scheduledTimesStatus ?? this.scheduledTimesStatus,
      scheduledTimes: scheduledTimes ?? this.scheduledTimes,
      scheduledTimesMessage: scheduledTimesMessage ?? this.scheduledTimesMessage,
      placeOrderStatus: placeOrderStatus ?? this.placeOrderStatus,
      placedOrder: placedOrder ?? this.placedOrder,
      placeOrderMessage: placeOrderMessage ?? this.placeOrderMessage,
    );
  }

  @override
  List<Object?> get props => [
        scheduledTimesStatus,
        scheduledTimes,
        scheduledTimesMessage,
        placeOrderStatus,
        placedOrder,
        placeOrderMessage,
      ];
}
