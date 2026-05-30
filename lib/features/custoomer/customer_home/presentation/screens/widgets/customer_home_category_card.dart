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
        height: 230.h,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F8FD),
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: const Color(0xFFE6EEFA)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFBFD3F2).withOpacity(0.18),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: AppImage(
                      imageUrl: data.imageUrl,
                      fit: BoxFit.contain,
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
            SizedBox(height: 10.h),
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