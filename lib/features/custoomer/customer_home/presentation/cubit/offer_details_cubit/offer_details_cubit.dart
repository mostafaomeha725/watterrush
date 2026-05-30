import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/offer_details_cubit/offer_details_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class OfferDetailsCubit extends Cubit<OfferDetailsState> {
  OfferDetailsCubit({required OfferSliderItemData? offer})
    : super(OfferDetailsState(offer: offer)) {
    _loadOffer(offer);
  }

  Future<void> _loadOffer(OfferSliderItemData? offer) async {
    if (offer == null) {
      emit(
        state.copyWith(isLoading: false, keepCurrentOffer: false, offer: null),
      );
      return;
    }

    emit(state.copyWith(isLoading: true, offer: offer));

    await Future<void>.delayed(const Duration(milliseconds: 280));

    final Map<int, int> initialQuantities = <int, int>{
      for (int index = 0; index < offer.products.length; index++) index: 1,
    };

    emit(
      state.copyWith(
        isLoading: false,
        offer: offer,
        quantities: initialQuantities,
        cartCount: 0,
      ),
    );
  }

  void incrementQuantity(int index) {
    final int currentValue = state.quantityFor(index);
    final Map<int, int> updated = Map<int, int>.from(state.quantities)
      ..[index] = currentValue + 1;
    emit(state.copyWith(quantities: updated));
  }

  void decrementQuantity(int index) {
    final int currentValue = state.quantityFor(index);
    if (currentValue <= 1) return;
    final Map<int, int> updated = Map<int, int>.from(state.quantities)
      ..[index] = currentValue - 1;
    emit(state.copyWith(quantities: updated));
  }

  void addToCart(int index) {
    final int quantity = state.quantityFor(index);
    emit(state.copyWith(cartCount: state.cartCount + quantity));
  }
}