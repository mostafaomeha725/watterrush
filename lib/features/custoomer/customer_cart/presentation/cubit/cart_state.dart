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
  final String? promoCode;
  final String discountType;
  final double discountPercentage;
  final bool isApplyingPromoCode;
  final String? promoCodeError;

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
    this.promoCode,
    this.discountType = 'percent',
    this.discountPercentage = 0.0,
    this.isApplyingPromoCode = false,
    this.promoCodeError,
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
    String? promoCode,
    String? discountType,
    double? discountPercentage,
    bool? isApplyingPromoCode,
    String? promoCodeError,
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
      promoCode: promoCode ?? this.promoCode,
      discountType: discountType ?? this.discountType,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      isApplyingPromoCode: isApplyingPromoCode ?? this.isApplyingPromoCode,
      promoCodeError: promoCodeError,
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
    promoCode,
    discountType,
    discountPercentage,
    isApplyingPromoCode,
    promoCodeError,
  ];
}

class CartError extends CartState {
  final String message;

  const CartError({required this.message});

  @override
  List<Object?> get props => [message];
}
