import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_customer_profile_usecase.dart';
import '../../../domain/usecases/update_customer_profile_usecase.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetCustomerProfileUseCase getCustomerProfileUseCase;
  final UpdateCustomerProfileUseCase updateCustomerProfileUseCase;

  ProfileCubit(
    this.getCustomerProfileUseCase,
    this.updateCustomerProfileUseCase,
  ) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());

    final result = await getCustomerProfileUseCase();

    result.fold(
      (failure) => emit(ProfileFailure(failure.message)),
      (customer) => emit(ProfileSuccess(customer)),
    );
  }

  Future<void> updateProfile({required String name}) async {
    emit(ProfileUpdateLoading());

    final result = await updateCustomerProfileUseCase(name: name);

    result.fold(
      (failure) => emit(ProfileUpdateFailure(failure.message)),
      (customer) => emit(ProfileUpdateSuccess(customer)),
    );
  }
}
