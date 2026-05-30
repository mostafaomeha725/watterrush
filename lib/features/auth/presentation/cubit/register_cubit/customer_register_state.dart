part of 'customer_register_cubit.dart';

@immutable
abstract class CustomerRegisterState {}

class CustomerRegisterInitial extends CustomerRegisterState {}

class CustomerRegisterLoading extends CustomerRegisterState {}

class CustomerRegisterSuccess extends CustomerRegisterState {
  final CustomerEntity customer;

  CustomerRegisterSuccess(this.customer);
}

class CustomerRegisterFailure extends CustomerRegisterState {
  final String errorMessage;

  CustomerRegisterFailure(this.errorMessage);
}