import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/error/failure.dart';
import '../../domain/usecases/get_cart_usecase.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase getCartUseCase;

  CartCubit({required this.getCartUseCase}) : super(CartInitial());

  Future<void> getCart() async {
    emit(CartLoading());
    final result = await getCartUseCase();
    result.fold(
      (Failure failure) => emit(CartError(message: failure.message)),
      (cart) => emit(CartLoaded(cart: cart)),
    );
  }
}
