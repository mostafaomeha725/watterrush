import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class OfferTermsCard extends StatelessWidget {
  const OfferTermsCard({super.key, required this.terms});

  final List<String> terms;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(14.w, 14.h, 14.w, 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F7FB),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFD3DEEA), width: 1.2),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF9EB5CC).withValues(alpha: 0.14),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.local_offer_outlined,
                size: 15.sp,
                color: const Color(0xFF335479),
              ),
              horizontalSpacing(6),
              AppText(
                'Offer Terms',
                style: font14w700.copyWith(color: const Color(0xFF19395D)),
              ),
            ],
          ),
          verticalSpacing(10),
          ...terms.map(
            (String term) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 1.h),
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7EFF8),
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      size: 14.sp,
                      color: const Color(0xFF6C98C6),
                    ),
                  ),
                  horizontalSpacing(8),
                  Expanded(
                    child: AppText(
                      term,
                      style: font12w500.copyWith(
                        color: const Color(0xFF395674),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
