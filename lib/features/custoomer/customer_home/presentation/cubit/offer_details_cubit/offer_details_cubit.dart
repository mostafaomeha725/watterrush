import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/usecases/get_offer_products_usecase.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/offer_details_cubit/offer_details_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class OfferDetailsCubit extends Cubit<OfferDetailsState> {
  final GetOfferProductsUseCase _getOfferProductsUseCase;

  OfferDetailsCubit({
    required OfferSliderItemData? offer,
    required GetOfferProductsUseCase getOfferProductsUseCase,
  })  : _getOfferProductsUseCase = getOfferProductsUseCase,
        super(OfferDetailsState(offer: offer)) {
    _loadOffer(offer);
  }

  Future<void> _loadOffer(OfferSliderItemData? offer, {int page = 1}) async {
    if (offer == null) {
      emit(
        state.copyWith(isLoading: false, keepCurrentOffer: false, offer: null),
      );
      return;
    }

    emit(state.copyWith(isLoading: true, offer: offer));

    final result = await _getOfferProductsUseCase(page: page);

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
      (paginatedData) {
        final allProducts = paginatedData.data;
        
        // Parse discount percentage from offer label (e.g., "35% OFF" -> 35)
        int? targetDiscount;
        if (offer.discountLabel.isNotEmpty) {
          final match = RegExp(r'\d+').firstMatch(offer.discountLabel);
          if (match != null) {
            targetDiscount = int.tryParse(match.group(0)!);
          }
        }

        // Filter products that match the discount percentage
        final products = allProducts.where((product) {
          if (targetDiscount == null) return true; // Show all if no discount label found
          if (product.priceBefore == null || product.priceBefore! <= product.price) return false;
          
          final double discountPercent = ((product.priceBefore! - product.price) / product.priceBefore!) * 100;
          // Allow a small tolerance for rounding (e.g., 34.5% is treated as 35%)
          return (discountPercent.round() - targetDiscount).abs() <= 1;
        }).toList();
        
        final Map<int, int> initialQuantities = <int, int>{
          for (int index = 0; index < products.length; index++) index: 1,
        };

        emit(
          state.copyWith(
            isLoading: false,
            apiProducts: products,
            quantities: initialQuantities,
            cartCount: 0,
            currentPage: paginatedData.currentPage,
            lastPage: paginatedData.lastPage,
          ),
        );
      },
    );
  }

  Future<void> loadPage(int page) async {
    if (state.offer != null) {
      await _loadOffer(state.offer, page: page);
    }
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
