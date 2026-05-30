import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialOfferCardAccentStrip extends StatelessWidget {
  const SpecialOfferCardAccentStrip({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[color, color.withValues(alpha: 0.55)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}