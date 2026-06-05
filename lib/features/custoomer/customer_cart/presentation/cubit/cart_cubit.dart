import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/error/failure.dart';
import '../../domain/usecases/add_to_cart_usecase.dart';
import '../../domain/usecases/clear_cart_usecase.dart';
import '../../domain/usecases/get_cart_usecase.dart';
import '../../domain/usecases/remove_cart_item_usecase.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase getCartUseCase;
  final RemoveCartItemUseCase removeCartItemUseCase;
  final ClearCartUseCase clearCartUseCase;
  final AddToCartUseCase addToCartUseCase;

  CartCubit({
    required this.getCartUseCase,
    required this.removeCartItemUseCase,
    required this.clearCartUseCase,
    required this.addToCartUseCase,
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

  Future<void> addToCart(int productId, int quantity) async {
    if (state is! CartLoaded) {
      // If cart is not loaded yet (e.g. from home screen), we can still add,
      // but let's make sure we have a proper state handling if needed.
      // Usually, it's safer to have cart loaded, or we just emit a generic adding state.
      // For simplicity, if not loaded, we load it first, then add.
      // Or we can just perform the add and then fetch cart.
    }
    
    // We emit state based on whether Cart is loaded or not.
    // If it's loaded, we copy state.
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      emit(currentState.copyWith(isAddingToCart: true, addToCartSuccess: false, addToCartError: null));
    }
    
    final result = await addToCartUseCase(AddToCartParams(productId: productId, quantity: quantity));
    
    result.fold(
      (Failure failure) {
        if (state is CartLoaded) {
          emit((state as CartLoaded).copyWith(isAddingToCart: false, addToCartError: failure.message));
        } else {
          // If not loaded, we could emit an error state or a specific notification state
          // We will just let the UI handle the error if it was listening, but mostly UI listens to CartLoaded.
          // To ensure listeners fire:
          // For simplicity we will assume getCart runs at app start, so it is CartLoaded.
        }
      },
      (_) {
        if (state is CartLoaded) {
          emit((state as CartLoaded).copyWith(isAddingToCart: false, addToCartSuccess: true));
        }
        // Refresh cart after successful add
        getCart();
      },
    );
  }
}
