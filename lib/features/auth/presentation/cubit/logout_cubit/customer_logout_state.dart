part of 'customer_logout_cubit.dart';

@immutable
abstract class CustomerLogoutState {}

class CustomerLogoutInitial extends CustomerLogoutState {}

class CustomerLogoutLoading extends CustomerLogoutState {}

class CustomerLogoutSuccess extends CustomerLogoutState {}

class CustomerLogoutFailure extends CustomerLogoutState {
  final String errorMessage;

  CustomerLogoutFailure(this.errorMessage);
}