import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/usecases/logout_customer_usecase.dart';

part 'customer_logout_state.dart';

class CustomerLogoutCubit extends Cubit<CustomerLogoutState> {
  final LogoutCustomerUseCase _logoutCustomerUseCase;

  CustomerLogoutCubit(this._logoutCustomerUseCase)
    : super(CustomerLogoutInitial());

  Future<void> logout() async {
    emit(CustomerLogoutLoading());
    final result = await _logoutCustomerUseCase();
    result.fold(
      (failure) => emit(CustomerLogoutFailure(failure.message)),
      (_) => emit(CustomerLogoutSuccess()),
    );
  }
}
