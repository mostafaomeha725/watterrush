import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/customer_entity.dart';
import '../../../domain/usecases/register_customer_usecase.dart';

part 'customer_register_state.dart';

class CustomerRegisterCubit extends Cubit<CustomerRegisterState> {
  final RegisterCustomerUseCase _registerCustomerUseCase;

  CustomerRegisterCubit(this._registerCustomerUseCase)
    : super(CustomerRegisterInitial());

  Future<void> register({
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(CustomerRegisterLoading());
    final result = await _registerCustomerUseCase(
      name: name,
      phone: phone,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
    result.fold(
      (failure) => emit(CustomerRegisterFailure(failure.message)),
      (customer) => emit(CustomerRegisterSuccess(customer)),
    );
  }
}
