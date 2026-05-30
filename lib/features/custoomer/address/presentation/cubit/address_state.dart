import 'package:equatable/equatable.dart';
import '../../domain/entities/address_entity.dart';

enum AddressStatus { initial, loading, success, failure }
enum AddressCreateStatus { initial, loading, success, failure }

class AddressState extends Equatable {
  const AddressState({
    this.status = AddressStatus.initial,
    this.createStatus = AddressCreateStatus.initial,
    this.addresses = const [],
    this.selectedAddress,
    this.errorMessage = '',
    this.createErrorMessage = '',
  });

  final AddressStatus status;
  final AddressCreateStatus createStatus;
  final List<AddressEntity> addresses;
  final AddressEntity? selectedAddress;
  final String errorMessage;
  final String createErrorMessage;

  AddressEntity? get defaultAddress {
    if (addresses.isEmpty) return null;
    try {
      return addresses.firstWhere((address) => address.isDefault);
    } catch (e) {
      return addresses.first;
    }
  }

  AddressState copyWith({
    AddressStatus? status,
    AddressCreateStatus? createStatus,
    List<AddressEntity>? addresses,
    AddressEntity? selectedAddress,
    String? errorMessage,
    String? createErrorMessage,
  }) {
    return AddressState(
      status: status ?? this.status,
      createStatus: createStatus ?? this.createStatus,
      addresses: addresses ?? this.addresses,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      errorMessage: errorMessage ?? this.errorMessage,
      createErrorMessage: createErrorMessage ?? this.createErrorMessage,
    );
  }

  @override
  List<Object?> get props => [status, createStatus, addresses, selectedAddress, errorMessage, createErrorMessage];
}
