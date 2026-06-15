import 'package:equatable/equatable.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/entities/product_entity.dart';

class OfferDetailsState extends Equatable {
  const OfferDetailsState({
    this.isLoading = true,
    this.offer,
    this.quantities = const <int, int>{},
    this.cartCount = 0,
    this.apiProducts = const <ProductEntity>[],
    this.errorMessage,
    this.currentPage = 1,
    this.lastPage = 1,
  });

  final bool isLoading;
  final OfferSliderItemData? offer;
  final Map<int, int> quantities;
  final int cartCount;
  final List<ProductEntity> apiProducts;
  final String? errorMessage;
  final int currentPage;
  final int lastPage;

  int quantityFor(int index) => quantities[index] ?? 1;

  OfferDetailsState copyWith({
    bool? isLoading,
    OfferSliderItemData? offer,
    Map<int, int>? quantities,
    int? cartCount,
    List<ProductEntity>? apiProducts,
    String? errorMessage,
    int? currentPage,
    int? lastPage,
    bool keepCurrentOffer = true,
  }) {
    return OfferDetailsState(
      isLoading: isLoading ?? this.isLoading,
      offer: keepCurrentOffer ? (offer ?? this.offer) : offer,
      quantities: quantities ?? this.quantities,
      cartCount: cartCount ?? this.cartCount,
      apiProducts: apiProducts ?? this.apiProducts,
      errorMessage: errorMessage ?? this.errorMessage,
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        isLoading,
        offer,
        quantities,
        cartCount,
        apiProducts,
        errorMessage,
        currentPage,
        lastPage,
      ];
}
