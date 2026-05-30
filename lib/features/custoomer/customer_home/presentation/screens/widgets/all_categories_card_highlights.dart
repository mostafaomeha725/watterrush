import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class AllCategoriesCardHighlights extends StatelessWidget {
  const AllCategoriesCardHighlights({super.key, required this.highlights});

  final List<String> highlights;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: highlights
          .take(3)
          .map(
            (String point) => Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Container(
                      width: 5.w,
                      height: 5.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFF227ED9),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  horizontalSpacing(7),
                  Expanded(
                    child: AppText(
                      point,
                      style: font12w500.copyWith(
                        color: const Color(0xFF4F6884),
                        height: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}