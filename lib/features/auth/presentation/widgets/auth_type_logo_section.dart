import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/widgets/app_asset.dart';

class AuthTypeLogoSection extends StatelessWidget {
  const AuthTypeLogoSection({
    this.height,
    this.alignment = Alignment.center,
    super.key,
  });

  final double? height;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: AppAsset(
        assetName: Assets.newLogo,
        height: height ?? 170.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
