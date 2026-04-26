import 'package:flutter/material.dart';

class CategoryItemData {
  const CategoryItemData({
    required this.title,
    required this.description,
    required this.imagePath,
    this.products = const <OfferProductItemData>[],
    this.headerColors = const <Color>[Color(0xFF1F63BC), Color(0xFF144F9F)],
    this.categoryLabel = 'Category',
    this.highlights = const <String>[],
    this.onOfferCount = 0,
  });

  final String title;
  final String description;
  final String imagePath;
  final List<OfferProductItemData> products;
  final List<Color> headerColors;
  final String categoryLabel;
  final List<String> highlights;
  final int onOfferCount;
}

class OfferSliderItemData {
  const OfferSliderItemData({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.colors,
    required this.flashDealLabel,
    required this.discountLabel,
    required this.validUntil,
    required this.terms,
    required this.products,
  });

  final String title;
  final String subtitle;
  final String imagePath;
  final List<Color> colors;
  final String flashDealLabel;
  final String discountLabel;
  final DateTime validUntil;
  final List<String> terms;
  final List<OfferProductItemData> products;
}

class OfferProductItemData {
  const OfferProductItemData({
    required this.name,
    required this.subtitle,
    required this.imageUrl,
    required this.currentPrice,
    required this.oldPrice,
    required this.saveAmount,
    required this.rating,
    required this.reviewsCount,
    required this.discountLabel,
    this.isPopular = false,
    this.isOnOffer = false,
  });

  final String name;
  final String subtitle;
  final String imageUrl;
  final double currentPrice;
  final double oldPrice;
  final int saveAmount;
  final double rating;
  final int reviewsCount;
  final String discountLabel;
  final bool isPopular;
  final bool isOnOffer;
}
