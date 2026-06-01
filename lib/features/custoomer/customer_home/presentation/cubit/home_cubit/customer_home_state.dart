import 'package:equatable/equatable.dart';
import '../../../domain/entities/slider_entity.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/product_entity.dart';

enum CustomerHomeStatus { initial, loading, success }

class CustomerHomeState extends Equatable {
  const CustomerHomeState({
    required this.currentBannerIndex,
    required this.status,
    required this.message,
    required this.sliders,
    required this.slidersStatus,
    required this.categories,
    required this.categoriesStatus,
    required this.popularProducts,
    required this.popularProductsStatus,
  });

  factory CustomerHomeState.initial() => const CustomerHomeState(
    currentBannerIndex: 0,
    status: CustomerHomeStatus.initial,
    message: '',
    sliders: [],
    slidersStatus: CustomerHomeStatus.initial,
    categories: [],
    categoriesStatus: CustomerHomeStatus.initial,
    popularProducts: [],
    popularProductsStatus: CustomerHomeStatus.initial,
  );

  final int currentBannerIndex;
  final CustomerHomeStatus status;
  final String message;
  final List<SliderEntity> sliders;
  final CustomerHomeStatus slidersStatus;
  final List<CategoryEntity> categories;
  final CustomerHomeStatus categoriesStatus;
  final List<ProductEntity> popularProducts;
  final CustomerHomeStatus popularProductsStatus;

  CustomerHomeState copyWith({
    int? currentBannerIndex,
    CustomerHomeStatus? status,
    String? message,
    List<SliderEntity>? sliders,
    CustomerHomeStatus? slidersStatus,
    List<CategoryEntity>? categories,
    CustomerHomeStatus? categoriesStatus,
    List<ProductEntity>? popularProducts,
    CustomerHomeStatus? popularProductsStatus,
  }) {
    return CustomerHomeState(
      currentBannerIndex: currentBannerIndex ?? this.currentBannerIndex,
      status: status ?? this.status,
      message: message ?? this.message,
      sliders: sliders ?? this.sliders,
      slidersStatus: slidersStatus ?? this.slidersStatus,
      categories: categories ?? this.categories,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      popularProducts: popularProducts ?? this.popularProducts,
      popularProductsStatus: popularProductsStatus ?? this.popularProductsStatus,
    );
  }

  @override
  List<Object?> get props => [
        currentBannerIndex,
        status,
        message,
        sliders,
        slidersStatus,
        categories,
        categoriesStatus,
        popularProducts,
        popularProductsStatus,
      ];
}