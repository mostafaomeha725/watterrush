import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/customer_entity.dart';
import '../../domain/usecases/login_customer_usecase.dart';

part 'customer_login_state.dart';

class CustomerLoginCubit extends Cubit<CustomerLoginState> {
  final LoginCustomerUseCase _loginCustomerUseCase;

  CustomerLoginCubit(this._loginCustomerUseCase)
    : super(CustomerLoginInitial());

  Future<void> login({
    required String phone,
    required String password,
  }) async {
    emit(CustomerLoginLoading());
    final result = await _loginCustomerUseCase(
      phone: phone,
      password: password,
    );
    result.fold(
      (failure) => emit(CustomerLoginFailure(failure.message)),
      (customer) => emit(CustomerLoginSuccess(customer)),
    );
  }
}
