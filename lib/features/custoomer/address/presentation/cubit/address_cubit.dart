import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/usecases/create_address_usecase.dart';
import '../../domain/usecases/update_address_usecase.dart';
import '../../domain/usecases/get_addresses_usecase.dart';
import '../../domain/usecases/set_default_address_usecase.dart';
import '../../domain/usecases/delete_address_usecase.dart';
import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit({
    required this.getAddressesUseCase,
    required this.createAddressUseCase,
    required this.updateAddressUseCase,
    required this.setDefaultAddressUseCase,
    required this.deleteAddressUseCase,
  }) : super(const AddressState()) {
    getAddresses();
  }

  final GetAddressesUseCase getAddressesUseCase;
  final CreateAddressUseCase createAddressUseCase;
  final UpdateAddressUseCase updateAddressUseCase;
  final SetDefaultAddressUseCase setDefaultAddressUseCase;
  final DeleteAddressUseCase deleteAddressUseCase;

  Future<void> getAddresses() async {
    emit(state.copyWith(status: AddressStatus.loading));

    final result = await getAddressesUseCase();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: AddressStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
      (addresses) {
        AddressEntity? defaultAddr;
        if (state.selectedAddress != null) {
          try {
            defaultAddr = addresses.firstWhere(
              (address) => address.id == state.selectedAddress!.id,
            );
          } catch (e) {
            defaultAddr = null;
          }
        }

        if (defaultAddr == null && addresses.isNotEmpty) {
          try {
            defaultAddr = addresses.firstWhere((address) => address.isDefault);
          } catch (e) {
            defaultAddr = addresses.first;
          }
        }

        emit(
          state.copyWith(
            status: AddressStatus.success,
            addresses: addresses,
            selectedAddress: defaultAddr,
          ),
        );
      },
    );
  }

  void selectAddress(AddressEntity address) {
    emit(state.copyWith(selectedAddress: address));
  }

  Future<void> createAddress({
    required String title,
    required String address,
    required String lat,
    required String lng,
    required bool isDefault,
  }) async {
    emit(state.copyWith(createStatus: AddressCreateStatus.loading));

    final params = CreateAddressParams(
      title: title,
      address: address,
      lat: lat,
      lng: lng,
      isDefault: isDefault,
    );

    final result = await createAddressUseCase(params);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            createStatus: AddressCreateStatus.failure,
            createErrorMessage: failure.message,
          ),
        );
      },
      (addressEntity) {
        emit(state.copyWith(createStatus: AddressCreateStatus.success));
        selectAddress(addressEntity);
        getAddresses(); // Refresh the list
      },
    );
  }

  Future<void> setDefaultAddress(int id) async {
    emit(state.copyWith(setDefaultStatus: AddressSetDefaultStatus.loading));

    final result = await setDefaultAddressUseCase(id);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            setDefaultStatus: AddressSetDefaultStatus.failure,
            setDefaultErrorMessage: failure.message,
          ),
        );
      },
      (addressEntity) {
        emit(state.copyWith(setDefaultStatus: AddressSetDefaultStatus.success));
        getAddresses(); // Refresh the list to get new default address
      },
    );
  }

  Future<void> deleteAddress(int id) async {
    emit(state.copyWith(deleteStatus: AddressDeleteStatus.loading));

    final result = await deleteAddressUseCase(id);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            deleteStatus: AddressDeleteStatus.failure,
            deleteErrorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(state.copyWith(deleteStatus: AddressDeleteStatus.success));
        getAddresses(); // Refresh the list after deleting
      },
    );
  }

  Future<void> updateAddress(UpdateAddressParams params) async {
    emit(state.copyWith(updateStatus: AddressUpdateStatus.loading));

    final result = await updateAddressUseCase(params);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            updateStatus: AddressUpdateStatus.failure,
            updateErrorMessage: failure.message,
          ),
        );
      },
      (address) {
        emit(state.copyWith(updateStatus: AddressUpdateStatus.success));
        getAddresses(); // Refresh list to reflect updates
      },
    );
  }
}
