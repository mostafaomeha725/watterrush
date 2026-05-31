import 'package:equatable/equatable.dart';
import '../../domain/entities/address_entity.dart';

enum AddressStatus { initial, loading, success, failure }
enum AddressCreateStatus { initial, loading, success, failure }
enum AddressSetDefaultStatus { initial, loading, success, failure }
enum AddressDeleteStatus { initial, loading, success, failure }

class AddressState extends Equatable {
  const AddressState({
    this.status = AddressStatus.initial,
    this.createStatus = AddressCreateStatus.initial,
    this.setDefaultStatus = AddressSetDefaultStatus.initial,
    this.deleteStatus = AddressDeleteStatus.initial,
    this.addresses = const [],
    this.selectedAddress,
    this.errorMessage = '',
    this.createErrorMessage = '',
    this.setDefaultErrorMessage = '',
    this.deleteErrorMessage = '',
  });

  final AddressStatus status;
  final AddressCreateStatus createStatus;
  final AddressSetDefaultStatus setDefaultStatus;
  final AddressDeleteStatus deleteStatus;
  final List<AddressEntity> addresses;
  final AddressEntity? selectedAddress;
  final String errorMessage;
  final String createErrorMessage;
  final String setDefaultErrorMessage;
  final String deleteErrorMessage;

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
    AddressSetDefaultStatus? setDefaultStatus,
    AddressDeleteStatus? deleteStatus,
    List<AddressEntity>? addresses,
    AddressEntity? selectedAddress,
    String? errorMessage,
    String? createErrorMessage,
    String? setDefaultErrorMessage,
    String? deleteErrorMessage,
  }) {
    return AddressState(
      status: status ?? this.status,
      createStatus: createStatus ?? this.createStatus,
      setDefaultStatus: setDefaultStatus ?? this.setDefaultStatus,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      addresses: addresses ?? this.addresses,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      errorMessage: errorMessage ?? this.errorMessage,
      createErrorMessage: createErrorMessage ?? this.createErrorMessage,
      setDefaultErrorMessage: setDefaultErrorMessage ?? this.setDefaultErrorMessage,
      deleteErrorMessage: deleteErrorMessage ?? this.deleteErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        createStatus,
        setDefaultStatus,
        deleteStatus,
        addresses,
        selectedAddress,
        errorMessage,
        createErrorMessage,
        setDefaultErrorMessage,
        deleteErrorMessage,
      ];
}
