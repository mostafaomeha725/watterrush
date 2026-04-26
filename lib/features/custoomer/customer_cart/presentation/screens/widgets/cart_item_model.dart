import 'package:flutter/material.dart';

class CartItemModel {
  const CartItemModel({
    required this.name,
    required this.price,
    required this.icon,
    this.imagePath,
    this.quantity = 1,
  });

  final String name;
  final double price;
  final IconData icon;
  final String? imagePath;
  final int quantity;

  CartItemModel copyWith({
    String? name,
    double? price,
    IconData? icon,
    String? imagePath,
    int? quantity,
  }) {
    return CartItemModel(
      name: name ?? this.name,
      price: price ?? this.price,
      icon: icon ?? this.icon,
      imagePath: imagePath ?? this.imagePath,
      quantity: quantity ?? this.quantity,
    );
  }
}
