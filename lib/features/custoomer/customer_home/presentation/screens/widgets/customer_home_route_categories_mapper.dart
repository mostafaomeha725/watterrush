import 'package:flutter/material.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_mock_data.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_view_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

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
