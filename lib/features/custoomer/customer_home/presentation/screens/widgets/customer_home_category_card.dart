import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_image.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_view_models.dart';

class CustomerHomeCategoryCard extends StatelessWidget {
  const CustomerHomeCategoryCard({
    required this.data,
    required this.onTap,
    super.key,
  });

  final HomeCategoryViewModel data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BounceIt(
      onPressed: onTap,
      child: Container(
        width: 175.w,
        height: 260.h,
        margin: EdgeInsets.only(right: 12.w),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                          width: 1,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11.r),
                        child: AppImage(
                          imageUrl: data.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  if (data.badgeText.isNotEmpty)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 30.w,
                        height: 30.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1A3A7A),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: AppText(
                            data.badgeText,
                            style: font14w700.copyWith(color: Colors.white),
                            alignment: AlignmentDirectional.center,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            AppText(
              data.title,
              maxLines: 1,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1F3560),
              ),
            ),
            SizedBox(height: 4.h),
            AppText(
              data.subtitle,
              maxLines: 2,
              style: TextStyle(
                fontSize: 10.sp,
                color: const Color(0xFF6F84A5),
                height: 1.3,
              ),
            ),
            SizedBox(height: 8.h),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                width: 28.w,
                height: 28.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F0FC),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 15.sp,
                  color: const Color(0xFF2A86F5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
