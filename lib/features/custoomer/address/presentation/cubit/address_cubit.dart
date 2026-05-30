import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/usecases/create_address_usecase.dart';
import '../../domain/usecases/get_addresses_usecase.dart';
import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit({
    required this.getAddressesUseCase,
    required this.createAddressUseCase,
  }) : super(const AddressState()) {
    getAddresses();
  }

  final GetAddressesUseCase getAddressesUseCase;
  final CreateAddressUseCase createAddressUseCase;

  Future<void> getAddresses() async {
    emit(state.copyWith(status: AddressStatus.loading));

    final result = await getAddressesUseCase();

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: AddressStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (addresses) {
        AddressEntity? defaultAddr;
        if (addresses.isNotEmpty) {
          try {
            defaultAddr = addresses.firstWhere((address) => address.isDefault);
          } catch (e) {
            defaultAddr = addresses.first;
          }
        }
        
        emit(state.copyWith(
          status: AddressStatus.success,
          addresses: addresses,
          selectedAddress: defaultAddr,
        ));
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
        emit(state.copyWith(
          createStatus: AddressCreateStatus.failure,
          createErrorMessage: failure.message,
        ));
      },
      (addressEntity) {
        emit(state.copyWith(createStatus: AddressCreateStatus.success));
        getAddresses(); // Refresh the list
      },
    );
  }
}
