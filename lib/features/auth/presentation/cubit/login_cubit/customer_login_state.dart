part of 'customer_login_cubit.dart';

@immutable
abstract class CustomerLoginState {}

class CustomerLoginInitial extends CustomerLoginState {}

class CustomerLoginLoading extends CustomerLoginState {}

class CustomerLoginSuccess extends CustomerLoginState {
  final CustomerEntity customer;

  CustomerLoginSuccess(this.customer);
}

class CustomerLoginFailure extends CustomerLoginState {
  final String errorMessage;

  CustomerLoginFailure(this.errorMessage);
}