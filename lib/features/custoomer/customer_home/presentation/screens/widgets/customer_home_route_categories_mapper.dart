import 'package:flutter/material.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/entities/category_entity.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_mock_data.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_view_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

List<HomeCategoryViewModel> mapApiCategoriesToHomeCategories(List<CategoryEntity> apiCategories) {
  return apiCategories.map((cat) {
    String imageUrl = '';
    if (cat.products.isNotEmpty && cat.products.first.images.isNotEmpty) {
      imageUrl = cat.products.first.images.first.image;
    }
    return HomeCategoryViewModel(
      title: cat.name,
      subtitle: '${cat.products.length} products',
      routeDescription: cat.name,
      imageUrl: imageUrl,
    );
  }).toList();
}

List<CategoryItemData> mapApiCategoriesToRouteCategories(List<CategoryEntity> apiCategories) {
  return apiCategories.map((cat) {
    final products = cat.products.map((p) {
      String imageUrl = '';
      if (p.images.isNotEmpty) {
        imageUrl = p.images.first.image;
      }
      return OfferProductItemData(
        name: p.title,
        subtitle: p.description,
        imageUrl: imageUrl,
        currentPrice: p.price,
        oldPrice: p.priceBefore ?? p.price,
        saveAmount: ((p.priceBefore ?? p.price) - p.price).toInt(),
        rating: 5.0, // Default rating as API doesn't provide
        reviewsCount: 0,
        discountLabel: '',
      );
    }).toList();

    String catImageUrl = Assets.gallon; // Fallback
    if (cat.products.isNotEmpty && cat.products.first.images.isNotEmpty) {
      catImageUrl = cat.products.first.images.first.image;
    }

    return CategoryItemData(
      id: cat.id,
      title: cat.name,
      description: '${products.length} products available',
      imagePath: catImageUrl,
      products: products,
      categoryLabel: cat.name,
    );
  }).toList();
}

List<CategoryItemData> mapToRouteCategories(
  List<HomeCategoryViewModel> categories,
) {
  return categories.map((HomeCategoryViewModel item) {
    final List<OfferProductItemData> products;
    final List<Color> headerColors;
    final String categoryLabel;
    final List<String> highlights;

    final String titleLower = item.title.toLowerCase();

    if (titleLower.contains('carton')) {
      products = waterCartonProducts;
      headerColors = const <Color>[Color(0xFF1A6FD4), Color(0xFF0EA5DC)];
      categoryLabel = 'Water Cartons';
      highlights = const <String>[
        'Pack sizes from 12 to 30 units',
        'Still & mineral varieties available',
        'Same-day delivery on all cartons',
      ];
    } else if (titleLower.contains('gallon')) {
      products = gallonProducts;
      headerColors = const <Color>[Color(0xFF0D5EA6), Color(0xFF1177CC)];
      categoryLabel = '5-Gallon Bottles';
      highlights = const <String>[
        'Ideal for home & office dispensers',
        'Mineral & alkaline options',
        'Flexible weekly subscription',
      ];
    } else if (titleLower.contains('bulk')) {
      products = bulkOrderProducts;
      headerColors = const <Color>[Color(0xFF23B26D), Color(0xFF15996A)];
      categoryLabel = 'Bulk Orders';
      highlights = const <String>[
        'Save up to 30% on large orders',
        'Dedicated account manager',
        'Priority delivery slots',
      ];
    } else {
      products = const <OfferProductItemData>[];
      headerColors = const <Color>[Color(0xFF1F63BC), Color(0xFF144F9F)];
      categoryLabel = 'Category';
      highlights = const <String>[
        'Daily refill service',
        'Pure and fresh quality',
        'Flexible delivery slots',
      ];
    }

    final int onOfferCount =
        products.where((OfferProductItemData p) => p.isOnOffer).length;

    return CategoryItemData(
      id: 0, // Fallback for mock data
      title: item.title,
      description: item.routeDescription,
      imagePath: Assets.gallon,
      products: products,
      headerColors: headerColors,
      categoryLabel: categoryLabel,
      highlights: highlights,
      onOfferCount: onOfferCount,
    );
  }).toList();
}