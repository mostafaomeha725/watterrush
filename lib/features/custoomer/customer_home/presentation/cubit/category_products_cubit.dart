import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/category_products_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit({required CategoryItemData? category})
    : super(CategoryProductsState(category: category)) {
    _loadCategory(category);
  }

  Future<void> _loadCategory(CategoryItemData? category) async {
    if (category == null) {
      emit(
        state.copyWith(
          isLoading: false,
          keepCurrentCategory: false,
          category: null,
          displayedProductIndexes: const <int>[],
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true, category: category, cartCount: 0));

    await Future<void>.delayed(const Duration(milliseconds: 260));

    final Map<int, int> initialQuantities = <int, int>{
      for (int index = 0; index < category.products.length; index++) index: 1,
    };

    emit(
      state.copyWith(
        isLoading: false,
        category: category,
        quantities: initialQuantities,
        cartCount: 0,
        addedProductIndexes: const <int>[],
      ),
    );

    _applyFilters();
  }

  void updateSearchQuery(String value) {
    emit(state.copyWith(searchQuery: value));
    _applyFilters();
  }

  void toggleOnOffer() {
    emit(state.copyWith(showOnOfferOnly: !state.showOnOfferOnly));
    _applyFilters();
  }

  void updateSort(CategoryProductsSort sort) {
    emit(state.copyWith(sort: sort));
    _applyFilters();
  }

  void incrementQuantity(int index) {
    final int currentValue = state.quantityFor(index);
    final Map<int, int> updated = Map<int, int>.from(state.quantities)
      ..[index] = currentValue + 1;
    emit(state.copyWith(quantities: updated));
  }

  void decrementQuantity(int index) {
    final int currentValue = state.quantityFor(index);
    if (currentValue <= 1) {
      return;
    }
    final Map<int, int> updated = Map<int, int>.from(state.quantities)
      ..[index] = currentValue - 1;
    emit(state.copyWith(quantities: updated));
  }

  void addToCart(int index) {
    final int quantity = state.quantityFor(index);
    final List<int> updatedAddedIndexes = List<int>.from(
      state.addedProductIndexes,
    );
    if (!updatedAddedIndexes.contains(index)) {
      updatedAddedIndexes.add(index);
    }

    emit(
      state.copyWith(
        cartCount: state.cartCount + quantity,
        addedProductIndexes: updatedAddedIndexes,
      ),
    );
  }

  void _applyFilters() {
    final CategoryItemData? category = state.category;
    if (category == null) {
      emit(state.copyWith(displayedProductIndexes: const <int>[]));
      return;
    }

    final String normalizedQuery = state.searchQuery.trim().toLowerCase();

    final List<int> visibleIndexes =
        List<int>.generate(
          category.products.length,
          (int index) => index,
        ).where((int index) {
          final OfferProductItemData product = category.products[index];
          final bool matchesSearch =
              normalizedQuery.isEmpty ||
              product.name.toLowerCase().contains(normalizedQuery) ||
              product.subtitle.toLowerCase().contains(normalizedQuery);
          final bool matchesOffer =
              !state.showOnOfferOnly ||
              product.isOnOffer ||
              product.oldPrice > product.currentPrice;
          return matchesSearch && matchesOffer;
        }).toList();

    visibleIndexes.sort((int firstIndex, int secondIndex) {
      final OfferProductItemData first = category.products[firstIndex];
      final OfferProductItemData second = category.products[secondIndex];

      switch (state.sort) {
        case CategoryProductsSort.popular:
          if (first.isPopular != second.isPopular) {
            return second.isPopular ? 1 : -1;
          }
          return second.rating.compareTo(first.rating);
        case CategoryProductsSort.priceLowToHigh:
          return first.currentPrice.compareTo(second.currentPrice);
        case CategoryProductsSort.priceHighToLow:
          return second.currentPrice.compareTo(first.currentPrice);
        case CategoryProductsSort.topRated:
          final int ratingCompare = second.rating.compareTo(first.rating);
          if (ratingCompare != 0) {
            return ratingCompare;
          }
          return second.reviewsCount.compareTo(first.reviewsCount);
      }
    });

    emit(state.copyWith(displayedProductIndexes: visibleIndexes));
  }
}
