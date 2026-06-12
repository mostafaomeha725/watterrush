import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_search.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class CategoryProductsHeader extends StatelessWidget {
  const CategoryProductsHeader({
    super.key,
    required this.category,
    required this.cartCount,
    required this.searchController,
    required this.onBackTap,
    required this.onCartTap,
    required this.onSearchChanged,
  });

  final CategoryItemData category;
  final int cartCount;
  final TextEditingController searchController;
  final VoidCallback onBackTap;
  final VoidCallback onCartTap;
  final ValueChanged<String> onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 18.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(24.r),
          bottomLeft: Radius.circular(24.r),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: category.headerColors,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 4.h,
            right: 8.w,
            child: Container(
              width: 90.w,
              height: 90.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x1AFFFFFF),
              ),
            ),
          ),
          Positioned(
            top: 28.h,
            right: 58.w,
            child: Container(
              width: 48.w,
              height: 48.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x1FFFFFFF),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: onBackTap,
                    child: Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 16.sp,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // GestureDetector(
                  //   onTap: onCartTap,
                  //   child: Container(
                  //     width: 36.w,
                  //     height: 36.w,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white.withValues(alpha: 0.18),
                  //       borderRadius: BorderRadius.circular(12.r),
                  //     ),
                  //     child: Stack(
                  //       clipBehavior: Clip.none,
                  //       children: <Widget>[
                  //         Center(
                  //           child: AppAsset(
                  //             assetName: Assets.shoppingBag,
                  //             width: 18.w,
                  //             height: 18.w,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //         if (cartCount > 0)
                  //           Positioned(
                  //             right: -3.w,
                  //             top: -4.h,
                  //             child: Container(
                  //               padding: EdgeInsets.symmetric(
                  //                 horizontal: 4.w,
                  //                 vertical: 1.h,
                  //               ),
                  //               decoration: const BoxDecoration(
                  //                 color: Color(0xFFFF5B5B),
                  //                 shape: BoxShape.circle,
                  //               ),
                  //               child: AppText(
                  //                 '$cartCount',
                  //                 style: font10w700.copyWith(
                  //                   color: Colors.white,
                  //                 ),
                  //                 alignment: AlignmentDirectional.center,
                  //               ),
                  //             ),
                  //           ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              verticalSpacing(10),
              AppText(
                category.categoryLabel,
                style: font10w500.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
              verticalSpacing(3),
              AppText(
                category.title,
                style: font26w700.copyWith(color: Colors.white),
                maxLines: 2,
              ),
              verticalSpacing(2),
              AppText(
                '${category.products.length} products available',
                style: font12w500.copyWith(color: const Color(0xFFD9EAFF)),
              ),
              verticalSpacing(14),
              CustomSearch(
                controller: searchController,
                hintText: 'Search in ${category.title}...',
                onChanged: onSearchChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
