import 'package:equatable/equatable.dart';
import '../../domain/entities/cart_entity.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final CartEntity cart;
  final bool isRemoving;
  final String? removeError;
  final bool removeSuccess;
  final bool isClearing;
  final String? clearError;
  final bool clearSuccess;
  final bool isAddingToCart;
  final String? addToCartError;
  final bool addToCartSuccess;

  const CartLoaded({
    required this.cart,
    this.isRemoving = false,
    this.removeError,
    this.removeSuccess = false,
    this.isClearing = false,
    this.clearError,
    this.clearSuccess = false,
    this.isAddingToCart = false,
    this.addToCartError,
    this.addToCartSuccess = false,
  });

  CartLoaded copyWith({
    CartEntity? cart,
    bool? isRemoving,
    String? removeError,
    bool? removeSuccess,
    bool? isClearing,
    String? clearError,
    bool? clearSuccess,
    bool? isAddingToCart,
    String? addToCartError,
    bool? addToCartSuccess,
  }) {
    return CartLoaded(
      cart: cart ?? this.cart,
      isRemoving: isRemoving ?? this.isRemoving,
      removeError: removeError,
      removeSuccess: removeSuccess ?? this.removeSuccess,
      isClearing: isClearing ?? this.isClearing,
      clearError: clearError,
      clearSuccess: clearSuccess ?? this.clearSuccess,
      isAddingToCart: isAddingToCart ?? this.isAddingToCart,
      addToCartError: addToCartError,
      addToCartSuccess: addToCartSuccess ?? this.addToCartSuccess,
    );
  }

  @override
  List<Object?> get props => [
    cart,
    isRemoving,
    removeError,
    removeSuccess,
    isClearing,
    clearError,
    clearSuccess,
    isAddingToCart,
    addToCartError,
    addToCartSuccess,
  ];
}

class CartError extends CartState {
  final String message;

  const CartError({required this.message});

  @override
  List<Object?> get props => [message];
}
