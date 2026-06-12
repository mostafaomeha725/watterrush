import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/all_categories_card_footer.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/all_categories_card_header.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/all_categories_card_highlights.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

class AllCategoriesListCard extends StatelessWidget {
  const AllCategoriesListCard({
    super.key,
    required this.category,
    required this.onBrowse,
  });

  final CategoryItemData category;
  final VoidCallback onBrowse;

  @override
  Widget build(BuildContext context) {
    final List<String> highlights = category.highlights.isEmpty
        ? <String>[
            'Top products available',
            'Fast delivery options',
            'Great for home & office',
          ]
        : category.highlights;

    return GestureDetector(
      onTap: onBrowse,
      behavior: HitTestBehavior.opaque,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xFF274D77).withValues(alpha: 0.12),
              blurRadius: 14.r,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AllCategoriesCardHeader(
              title: category.title,
              productsCount: category.products.length,
              onOfferCount: category.onOfferCount,
              headerColors: category.headerColors,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    category.description,
                    style: font14w500.copyWith(color: const Color(0xFF435D78)),
                  ),
                  verticalSpacing(8),
                  AllCategoriesCardHighlights(highlights: highlights),
                  verticalSpacing(6),
                  AllCategoriesCardFooter(
                    products: category.products,
                    onBrowse: onBrowse,
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
