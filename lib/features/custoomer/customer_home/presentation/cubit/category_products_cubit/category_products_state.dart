import 'package:equatable/equatable.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

enum CategoryProductsSort { popular, priceLowToHigh, priceHighToLow, topRated }

extension CategoryProductsSortX on CategoryProductsSort {
  String get label {
    switch (this) {
      case CategoryProductsSort.popular:
        return 'Popular';
      case CategoryProductsSort.priceLowToHigh:
        return 'Price: Low to High';
      case CategoryProductsSort.priceHighToLow:
        return 'Price: High to Low';
      case CategoryProductsSort.topRated:
        return 'Top Rated';
    }
  }
}

class CategoryProductsState extends Equatable {
  const CategoryProductsState({
    this.isLoading = true,
    this.category,
    this.quantities = const <int, int>{},
    this.cartCount = 0,
    this.searchQuery = '',
    this.showOnOfferOnly = false,
    this.sort = CategoryProductsSort.popular,
    this.displayedProductIndexes = const <int>[],
    this.addedProductIndexes = const <int>[],
  });

  final bool isLoading;
  final CategoryItemData? category;
  final Map<int, int> quantities;
  final int cartCount;
  final String searchQuery;
  final bool showOnOfferOnly;
  final CategoryProductsSort sort;
  final List<int> displayedProductIndexes;
  final List<int> addedProductIndexes;

  int quantityFor(int index) => quantities[index] ?? 1;

  bool isAdded(int index) => addedProductIndexes.contains(index);

  CategoryProductsState copyWith({
    bool? isLoading,
    CategoryItemData? category,
    Map<int, int>? quantities,
    int? cartCount,
    String? searchQuery,
    bool? showOnOfferOnly,
    CategoryProductsSort? sort,
    List<int>? displayedProductIndexes,
    List<int>? addedProductIndexes,
    bool keepCurrentCategory = true,
  }) {
    return CategoryProductsState(
      isLoading: isLoading ?? this.isLoading,
      category: keepCurrentCategory ? (category ?? this.category) : category,
      quantities: quantities ?? this.quantities,
      cartCount: cartCount ?? this.cartCount,
      searchQuery: searchQuery ?? this.searchQuery,
      showOnOfferOnly: showOnOfferOnly ?? this.showOnOfferOnly,
      sort: sort ?? this.sort,
      displayedProductIndexes:
          displayedProductIndexes ?? this.displayedProductIndexes,
      addedProductIndexes: addedProductIndexes ?? this.addedProductIndexes,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    isLoading,
    category,
    quantities,
    cartCount,
    searchQuery,
    showOnOfferOnly,
    sort,
    displayedProductIndexes,
    addedProductIndexes,
  ];
}
