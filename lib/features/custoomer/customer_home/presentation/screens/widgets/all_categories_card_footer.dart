import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/app_image.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class AllCategoriesCardFooter extends StatelessWidget {
  const AllCategoriesCardFooter({
    super.key,
    required this.products,
    required this.onBrowse,
  });

  final List<OfferProductItemData> products;
  final VoidCallback onBrowse;

  @override
  Widget build(BuildContext context) {
    final List<OfferProductItemData> previewProducts = products
        .take(3)
        .toList();
    final int moreProductsCount = products.length - previewProducts.length;

    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              ...previewProducts.map(
                (OfferProductItemData product) => Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: Container(
                    width: 34.w,
                    height: 34.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFE0ECF8),
                        width: 1.4,
                      ),
                    ),
                    child: AppImage(
                      imageUrl: product.imageUrl,
                      fit: BoxFit.cover,
                      showprogressIndicator: false,
                    ),
                  ),
                ),
              ),
              if (moreProductsCount > 0)
                Container(
                  width: 34.w,
                  height: 34.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDEEAF8),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: AppText(
                    '+$moreProductsCount',
                    style: font10w700.copyWith(color: const Color(0xFF2E6AA5)),
                    alignment: AlignmentDirectional.center,
                  ),
                ),
            ],
          ),
        ),
        horizontalSpacing(10),
        SizedBox(
          width: 98.w,
          child: AppButton(
            text: 'Browse',
            onPressed: onBrowse,
            height: 34.h,
            color: const Color(0xFFE4F3FF),
            borderColor: const Color(0xFFD0E8FB),
            radius: 999.r,
            textSize: 12.sp,
            textWeight: FontWeight.w700,
            textColor: const Color(0xFF1478D9),
          ),
        ),
      ],
    );
  }
}
