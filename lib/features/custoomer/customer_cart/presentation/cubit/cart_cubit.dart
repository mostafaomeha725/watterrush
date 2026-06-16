import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/error/failure.dart';
import '../../domain/usecases/add_to_cart_usecase.dart';
import '../../domain/usecases/clear_cart_usecase.dart';
import '../../domain/usecases/get_cart_usecase.dart';
import '../../domain/usecases/remove_cart_item_usecase.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/usecases/update_cart_item_usecase.dart';
import '../../domain/usecases/apply_promo_code_usecase.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase getCartUseCase;
  final RemoveCartItemUseCase removeCartItemUseCase;
  final ClearCartUseCase clearCartUseCase;
  final AddToCartUseCase addToCartUseCase;
  final UpdateCartItemUseCase updateCartItemUseCase;
  final ApplyPromoCodeUseCase applyPromoCodeUseCase;

  CartCubit({
    required this.getCartUseCase,
    required this.removeCartItemUseCase,
    required this.clearCartUseCase,
    required this.addToCartUseCase,
    required this.updateCartItemUseCase,
    required this.applyPromoCodeUseCase,
  }) : super(CartInitial());

  Future<void> getCart() async {
    if (state is! CartLoaded) {
      emit(CartLoading());
    }
    final result = await getCartUseCase();
    result.fold(
      (Failure failure) {
        if (state is! CartLoaded) {
          emit(CartError(message: failure.message));
        }
      },
      (cart) {
        if (state is CartLoaded) {
          emit(
            (state as CartLoaded).copyWith(
              cart: cart,
              removeSuccess: false,
              clearSuccess: false,
              addToCartSuccess: false,
            ),
          );
        } else {
          emit(CartLoaded(cart: cart));
        }
      },
    );
  }

  Future<void> removeCartItem(int itemId) async {
    if (state is! CartLoaded) return;
    final currentState = state as CartLoaded;

    emit(
      currentState.copyWith(
        isRemoving: true,
        removeSuccess: false,
        removeError: null,
      ),
    );

    final result = await removeCartItemUseCase(itemId);
    result.fold(
      (Failure failure) => emit(
        currentState.copyWith(isRemoving: false, removeError: failure.message),
      ),
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

    emit(
      currentState.copyWith(
        isClearing: true,
        clearSuccess: false,
        clearError: null,
      ),
    );

    final result = await clearCartUseCase();
    result.fold(
      (Failure failure) => emit(
        currentState.copyWith(isClearing: false, clearError: failure.message),
      ),
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
      emit(
        currentState.copyWith(
          isAddingToCart: true,
          addToCartSuccess: false,
          addToCartError: null,
        ),
      );
    }

    final result = await addToCartUseCase(
      AddToCartParams(productId: productId, quantity: quantity),
    );

    result.fold(
      (Failure failure) {
        if (state is CartLoaded) {
          emit(
            (state as CartLoaded).copyWith(
              isAddingToCart: false,
              addToCartError: failure.message,
            ),
          );
        } else {
          // If not loaded, we could emit an error state or a specific notification state
          // We will just let the UI handle the error if it was listening, but mostly UI listens to CartLoaded.
          // To ensure listeners fire:
          // For simplicity we will assume getCart runs at app start, so it is CartLoaded.
        }
      },
      (_) {
        if (state is CartLoaded) {
          emit(
            (state as CartLoaded).copyWith(
              isAddingToCart: false,
              addToCartSuccess: true,
            ),
          );
        }
        // Refresh cart after successful add
        getCart();
      },
    );
  }

  final Map<int, Timer> _updateTimers = {};
  int _inflightUpdates = 0;

  Future<void> updateCartItem(int itemId, int quantity) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;

      final oldItems = currentState.cart.items;
      final itemIndex = oldItems.indexWhere((item) => item.id == itemId);

      if (itemIndex != -1) {
        final oldItem = oldItems[itemIndex];

        final newItem = CartItemEntity(
          id: oldItem.id,
          productId: oldItem.productId,
          bundleId: oldItem.bundleId,
          title: oldItem.title,
          price: oldItem.price,
          image: oldItem.image,
          quantity: quantity,
          itemSubtotal: oldItem.price * quantity,
        );

        final newItems = List<CartItemEntity>.from(oldItems);
        newItems[itemIndex] = newItem;

        num newTotal = 0;
        for (var item in newItems) {
          newTotal += item.itemSubtotal;
        }

        final newCart = CartEntity(
          id: currentState.cart.id,
          items: newItems,
          total: newTotal,
        );

        emit(currentState.copyWith(cart: newCart, addToCartError: null));
      }
    }

    _updateTimers[itemId]?.cancel();
    _updateTimers[itemId] = Timer(const Duration(milliseconds: 500), () async {
      _inflightUpdates++;

      final result = await updateCartItemUseCase(
        UpdateCartItemParams(itemId: itemId, quantity: quantity),
      );

      _inflightUpdates--;

      result.fold(
        (Failure failure) {
          if (state is CartLoaded) {
            emit(
              (state as CartLoaded).copyWith(addToCartError: failure.message),
            );
            if (_inflightUpdates == 0 &&
                !_updateTimers.values.any((t) => t.isActive)) {
              _getCartSilently();
            }
          }
        },
        (_) {
          if (_inflightUpdates == 0 &&
              !_updateTimers.values.any((t) => t.isActive)) {
            _getCartSilently();
          }
        },
      );
    });
  }

  @override
  Future<void> close() {
    for (var timer in _updateTimers.values) {
      timer.cancel();
    }
    return super.close();
  }

  Future<void> applyPromoCode(String code) async {
    if (state is! CartLoaded) return;
    final currentState = state as CartLoaded;

    emit(
      currentState.copyWith(isApplyingPromoCode: true, promoCodeError: null),
    );

    final result = await applyPromoCodeUseCase(code);

    result.fold(
      (failure) {
        emit(
          currentState.copyWith(
            isApplyingPromoCode: false,
            promoCodeError: failure.message,
            promoCode: null,
            discountPercentage: 0.0,
          ),
        );
      },
      (discountData) {
        emit(
          currentState.copyWith(
            isApplyingPromoCode: false,
            promoCode: code,
            discountType: discountData.value1,
            discountPercentage: discountData.value2,
            promoCodeError: null,
          ),
        );
      },
    );
  }

  void removePromoCode() {
    if (state is! CartLoaded) return;
    final currentState = state as CartLoaded;

    emit(
      currentState.copyWith(
        promoCode: null,
        discountPercentage: 0.0,
        promoCodeError: null,
      ),
    );
  }

  Future<void> _getCartSilently() async {
    final result = await getCartUseCase();
    result.fold(
      (Failure failure) {
        // Silently ignore
      },
      (cart) {
        if (state is CartLoaded) {
          emit((state as CartLoaded).copyWith(cart: cart));
        } else {
          emit(CartLoaded(cart: cart));
        }
      },
    );
  }
}
