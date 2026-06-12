import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/app_image.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({
    super.key,
    required this.imageUrl,
    required this.isAvailable,
  });

  final String imageUrl;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return Container(
        width: double.infinity,
        height: 300.h,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 300.h,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: isAvailable
          ? AppImage(imageUrl: imageUrl, fit: BoxFit.contain)
          : ColorFiltered(
              colorFilter: const ColorFilter.matrix(<double>[
                0.2126, 0.7152, 0.0722, 0, 0,
                0.2126, 0.7152, 0.0722, 0, 0,
                0.2126, 0.7152, 0.0722, 0, 0,
                0,      0,      0,      1, 0,
              ]),
              child: Opacity(
                opacity: 0.7,
                child: AppImage(imageUrl: imageUrl, fit: BoxFit.contain),
              ),
            ),
    );
  }
}
