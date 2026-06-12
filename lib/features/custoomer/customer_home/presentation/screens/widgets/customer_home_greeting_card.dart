import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/core/di/services_locator.dart';
import 'package:waterrush/core/cache/preferences_storage.dart';
import 'package:waterrush/core/cache/preferences_storage_keys.dart';

class CustomerHomeGreetingCard extends StatelessWidget {
  const CustomerHomeGreetingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = sl<PreferencesStorage>();
    final String fullName = prefs.getString(key: PreferencesKeys.name) ?? 'Guest';
    final String firstName = fullName.split(' ').first;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 11.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFE4ECF8)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFBFD0E9).withOpacity(0.15),
            blurRadius: 14.r,
            offset: Offset(0, 6.h),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: AppAsset(assetName: Assets.water, fit: BoxFit.contain),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.waving_hand_rounded,
                      color: const Color(0xFFFFC107),
                      size: 22.sp,
                    ),
                    SizedBox(width: 7.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              AppText(
                                'Good morning, ',
                                style: font14w500.copyWith(
                                  color: const Color(0xFF1F3560),
                                ),
                              ),
                              AppText(
                                '$firstName!',
                                style: font14w700.copyWith(
                                  color: const Color(0xFF1E6EF2),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          AppText(
                            'Fresh water delivered on time',
                            style: font10w400.copyWith(
                              color: const Color(0xFF6F84A5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
