import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/error/failure.dart';
import '../../domain/usecases/clear_cart_usecase.dart';
import '../../domain/usecases/get_cart_usecase.dart';
import '../../domain/usecases/remove_cart_item_usecase.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase getCartUseCase;
  final RemoveCartItemUseCase removeCartItemUseCase;
  final ClearCartUseCase clearCartUseCase;

  CartCubit({
    required this.getCartUseCase,
    required this.removeCartItemUseCase,
    required this.clearCartUseCase,
  }) : super(CartInitial());

  Future<void> getCart() async {
    emit(CartLoading());
    final result = await getCartUseCase();
    result.fold(
      (Failure failure) => emit(CartError(message: failure.message)),
      (cart) => emit(CartLoaded(cart: cart)),
    );
  }

  Future<void> removeCartItem(int itemId) async {
    if (state is! CartLoaded) return;
    final currentState = state as CartLoaded;
    
    emit(currentState.copyWith(isRemoving: true, removeSuccess: false, removeError: null));
    
    final result = await removeCartItemUseCase(itemId);
    result.fold(
      (Failure failure) => emit(currentState.copyWith(isRemoving: false, removeError: failure.message)),
      (_) {
        emit(currentState.copyWith(isRemoving: false, removeSuccess: true));
        // Refresh cart after success
        getCart();
      },
    );
  }

  Future<void> clearCart() async {
    if (state is! CartLoaded) return;
    final currentState = state as CartLoaded;
    
    emit(currentState.copyWith(isClearing: true, clearSuccess: false, clearError: null));
    
    final result = await clearCartUseCase();
    result.fold(
      (Failure failure) => emit(currentState.copyWith(isClearing: false, clearError: failure.message)),
      (_) {
        emit(currentState.copyWith(isClearing: false, clearSuccess: true));
        // Refresh cart after success
        getCart();
      },
    );
  }
}
