import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/category_products_cubit/category_products_state.dart';

class CategoryProductsFiltersRow extends StatelessWidget {
  const CategoryProductsFiltersRow({
    super.key,
    required this.state,
    required this.onToggleOnOffer,
    required this.onSortSelected,
  });

  final CategoryProductsState state;
  final VoidCallback onToggleOnOffer;
  final ValueChanged<CategoryProductsSort> onSortSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: onToggleOnOffer,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 7.h),
            decoration: BoxDecoration(
              color: state.showOnOfferOnly
                  ? const Color(0xFF0E69CF)
                  : Colors.white,
              borderRadius: BorderRadius.circular(999.r),
              border: Border.all(
                color: state.showOnOfferOnly
                    ? const Color(0xFF0E69CF)
                    : const Color(0xFFD8E3F1),
              ),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.local_offer_rounded,
                  size: 14.sp,
                  color: state.showOnOfferOnly
                      ? Colors.white
                      : const Color(0xFF7991AB),
                ),
                horizontalSpacing(4),
                AppText(
                  'On Offer',
                  style: font10w700.copyWith(
                    color: state.showOnOfferOnly
                        ? Colors.white
                        : const Color(0xFF637D99),
                  ),
                ),
              ],
            ),
          ),
        ),
        horizontalSpacing(8),
        Expanded(
          child: PopupMenuButton<CategoryProductsSort>(
            tooltip: '',
            onSelected: onSortSelected,
            itemBuilder: (BuildContext context) {
              return CategoryProductsSort.values
                  .map(
                    (CategoryProductsSort sortItem) =>
                        PopupMenuItem<CategoryProductsSort>(
                          value: sortItem,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: AppText(
                                  sortItem.label,
                                  style: font14w500.copyWith(
                                    color: const Color(0xFF1E3752),
                                  ),
                                ),
                              ),
                              if (state.sort == sortItem)
                                Icon(
                                  Icons.check,
                                  size: 16.sp,
                                  color: const Color(0xFF0F6FD6),
                                ),
                            ],
                          ),
                        ),
                  )
                  .toList();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(999.r),
                border: Border.all(color: const Color(0xFFD8E3F1)),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.tune_rounded,
                    size: 14.sp,
                    color: const Color(0xFF7991AB),
                  ),
                  horizontalSpacing(5),
                  Expanded(
                    child: AppText(
                      state.sort.label,
                      style: font10w500.copyWith(
                        color: const Color(0xFF607A97),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 16.sp,
                    color: const Color(0xFF7F97AF),
                  ),
                ],
              ),
            ),
          ),
        ),
        horizontalSpacing(8),
        AppText(
          '${state.displayedProductIndexes.length} items',
          style: font12w700.copyWith(color: const Color(0xFF0E69CF)),
        ),
      ],
    );
  }
}