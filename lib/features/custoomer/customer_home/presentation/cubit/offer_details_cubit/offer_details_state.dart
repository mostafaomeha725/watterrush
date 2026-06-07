import 'package:equatable/equatable.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class OfferDetailsState extends Equatable {
  const OfferDetailsState({
    this.isLoading = true,
    this.offer,
    this.quantities = const <int, int>{},
    this.cartCount = 0,
  });

  final bool isLoading;
  final OfferSliderItemData? offer;
  final Map<int, int> quantities;
  final int cartCount;

  int quantityFor(int index) => quantities[index] ?? 1;

  OfferDetailsState copyWith({
    bool? isLoading,
    OfferSliderItemData? offer,
    Map<int, int>? quantities,
    int? cartCount,
    bool keepCurrentOffer = true,
  }) {
    return OfferDetailsState(
      isLoading: isLoading ?? this.isLoading,
      offer: keepCurrentOffer ? (offer ?? this.offer) : offer,
      quantities: quantities ?? this.quantities,
      cartCount: cartCount ?? this.cartCount,
    );
  }

  @override
  List<Object?> get props => <Object?>[isLoading, offer, quantities, cartCount];
}
