import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:waterrush/core/utils/easy_loading.dart';

import '../theme/light_colors.dart';

class CustomLoading {
  static AbsorbPointer showLoadingView() {
    return AbsorbPointer(
      absorbing: true,
      child: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Center(
          child: SpinKitDoubleBounce(
            color: AppLightColors.primary,
            size: 40.sh,
          ),
        ),
      ),
    );
  }

  static AbsorbPointer showLoader({double scale = 1.0}) {
    return AbsorbPointer(
      absorbing: true,
      child: Center(
        child: Transform.scale(
          scale: scale,
          child: Container(
            padding: EdgeInsets.all(22.r),
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(18.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const AppMorphLoader(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
