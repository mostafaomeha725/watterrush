import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:waterrush/core/extensions/ext_theme.dart';

class AppImage extends StatefulWidget {
  const AppImage({
    super.key,
    required this.imageUrl,
    this.borderRadius,
    this.width,
    this.height,
    this.fit,
    this.onImageLoaded,
    this.showprogressIndicator = true,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  final VoidCallback? onImageLoaded;
  final bool showprogressIndicator;

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage> {
  bool _isImageLoaded = false;

  void _callOnImageLoadedOnce() {
    if (!_isImageLoaded) {
      _isImageLoaded = true;
      widget.onImageLoaded?.call();
    }
  }

  Widget _buildPlaceholder() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F7FF),
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF9AAEC3).withOpacity(0.15),
                blurRadius: 8.r,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Icons.image_not_supported_rounded,
            color: const Color(0xFF9AAEC3),
            size: 20.sp,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrl.isEmpty) {
      return ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
        child: _buildPlaceholder(),
      );
    }

    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.zero,
      child: Image.network(
        widget.imageUrl,
        fit: widget.fit ?? BoxFit.cover,
        width: widget.width,
        height: widget.height,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (frame != null || wasSynchronouslyLoaded) {
            _callOnImageLoadedOnce();
            return child;
          }

          return widget.showprogressIndicator
              ? Center(
                  child: SpinKitFadingCircle(
                    color: context.colorScheme.primary,
                    size: 30.h,
                  ),
                )
              : const SizedBox();
        },
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholder();
        },
      ),
    );
  }
}
