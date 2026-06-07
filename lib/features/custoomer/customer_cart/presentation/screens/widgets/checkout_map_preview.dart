import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CheckoutMapPreview extends StatelessWidget {
  const CheckoutMapPreview({
    super.key,
    required this.onViewMap,
    this.selectedAddress,
    this.selectedCoordinates,
  });

  final VoidCallback onViewMap;
  final String? selectedAddress;
  final String? selectedCoordinates;

  @override
  Widget build(BuildContext context) {
    final bool hasLocation =
        selectedCoordinates != null && selectedCoordinates!.trim().isNotEmpty;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFD7F3FC), Color(0xFFBAE6F8)],
        ),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFF9FD5EA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 46.w,
                height: 46.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Icon(
                  Icons.location_on_outlined,
                  size: 28.sp,
                  color: const Color(0xFF0297C6),
                ),
              ),
              horizontalSpacing(10),
              Expanded(
                child: AppText(
                  hasLocation
                      ? 'Pinned Delivery Location'
                      : 'Delivery Location',
                  style: font16w700.copyWith(color: const Color(0xFF0E3857)),
                ),
              ),
            ],
          ),
          verticalSpacing(10),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.75),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFC5E4F0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  selectedAddress?.trim().isNotEmpty == true
                      ? selectedAddress!
                      : 'Select your exact drop-off point from map.',
                  maxLines: 2,
                  style: font12w500.copyWith(color: const Color(0xFF2A4C63)),
                ),
                if (hasLocation) ...[
                  verticalSpacing(4),
                  AppText(
                    selectedCoordinates!,
                    style: font12w400.copyWith(color: const Color(0xFF5C7386)),
                  ),
                ],
              ],
            ),
          ),
          verticalSpacing(12),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: hasLocation ? 'Change on Map' : 'View on Map',
                  onPressed: onViewMap,
                  height: 38.h,
                  textSize: 13.sp,
                  radius: 22.r,
                  color: AppLightColors.white,
                  textColor: const Color(0xFF078EC2),
                  borderColor: const Color(0xFFD8EDF6),
                ),
              ),
              if (hasLocation) ...[
                horizontalSpacing(8),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 9.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0EA5E9),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: AppText(
                    'GPS',
                    style: font10w700.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
