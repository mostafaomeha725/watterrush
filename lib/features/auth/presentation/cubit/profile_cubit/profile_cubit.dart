import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_customer_profile_usecase.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetCustomerProfileUseCase getCustomerProfileUseCase;

  ProfileCubit(this.getCustomerProfileUseCase) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());

    final result = await getCustomerProfileUseCase();

    result.fold(
      (failure) => emit(ProfileFailure(failure.message)),
      (customer) => emit(ProfileSuccess(customer)),
    );
  }
}
