import 'package:flutter/material.dart';

class SubscribeFrequencyOption {
  const SubscribeFrequencyOption({
    required this.title,
    required this.cadence,
    required this.discount,
  });

  final String title;
  final String cadence;
  final String discount;
}

class SubscribeProductOption {
  const SubscribeProductOption({
    required this.title,
    required this.priceLabel,
    required this.icon,
  });

  final String title;
  final String priceLabel;
  final IconData icon;
}