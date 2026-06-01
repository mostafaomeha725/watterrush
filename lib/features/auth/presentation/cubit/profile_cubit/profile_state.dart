import '../../../domain/entities/customer_entity.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final CustomerEntity customer;

  ProfileSuccess(this.customer);
}

class ProfileFailure extends ProfileState {
  final String message;

  ProfileFailure(this.message);
}
