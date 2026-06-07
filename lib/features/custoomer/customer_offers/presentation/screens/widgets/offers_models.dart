import 'package:flutter/material.dart';

class OfferItemModel {
  const OfferItemModel({
    required this.title,
    required this.subtitle,
    required this.validText,
    required this.code,
    required this.accentColor,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final String validText;
  final String code;
  final Color accentColor;
  final IconData icon;
}

class OfferStepModel {
  const OfferStepModel({
    required this.step,
    required this.title,
    required this.subtitle,
  });

  final int step;
  final String title;
  final String subtitle;
}
