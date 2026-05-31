import 'package:equatable/equatable.dart';
import 'package:waterrush/features/custoomer/customer_offers/domain/entities/promo_code_entity.dart';

abstract class OffersState extends Equatable {
  const OffersState();

  @override
  List<Object?> get props => [];
}

class OffersInitial extends OffersState {}

class OffersLoading extends OffersState {}

class OffersLoaded extends OffersState {
  final List<PromoCodeEntity> promoCodes;

  const OffersLoaded(this.promoCodes);

  @override
  List<Object?> get props => [promoCodes];
}

class OffersError extends OffersState {
  final String message;

  const OffersError(this.message);

  @override
  List<Object?> get props => [message];
}
