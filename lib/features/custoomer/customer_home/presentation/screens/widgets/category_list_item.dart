import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({super.key, required this.data, this.onTap});

  final CategoryItemData data;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: const Color(0xFFE9F2FF),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              width: 78.w,
              height: 78.w,
              decoration: BoxDecoration(
                color: const Color(0x330E7FE5),
                borderRadius: BorderRadius.circular(12.r),
              ),
              clipBehavior: Clip.antiAlias,
              child: AppAsset(assetName: data.imagePath, fit: BoxFit.cover),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    data.title,
                    style: font22w700.copyWith(color: const Color(0xFF203A5F)),
                  ),
                  SizedBox(height: 4.h),
                  AppText(
                    data.description,
                    maxLines: 2,
                    style: font14w500.copyWith(
                      height: 1.25,
                      color: const Color(0xFF607692),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
