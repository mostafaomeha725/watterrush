import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/app_image.dart';
import '../../../domain/entities/slider_entity.dart';

class CustomerHomeOfferBannerMedia extends StatelessWidget {
  const CustomerHomeOfferBannerMedia({required this.slider, super.key});

  final SliderEntity slider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 20.h,
            bottom: 10.h,
            right: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.transparent, Colors.white],
                    stops: [0.0, 0.4],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: AppImage(
                  imageUrl: slider.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
