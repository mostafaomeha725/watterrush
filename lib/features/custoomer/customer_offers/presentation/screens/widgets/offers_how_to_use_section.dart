import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_offers/presentation/screens/widgets/offers_models.dart';

class OffersHowToUseSection extends StatelessWidget {
  const OffersHowToUseSection({super.key, required this.steps});

  final List<OfferStepModel> steps;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(14.w, 14.h, 14.w, 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFDDE3EC)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'How to use promo codes?',
            style: font18w700.copyWith(color: const Color(0xFF0F2B46)),
          ),
          SizedBox(height: 14.h),
          ...steps.map(
            (step) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: 32.w,
                      child: Center(
                        child: Container(
                          width: 32.w,
                          height: 32.w,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xFFBDECF8),
                            shape: BoxShape.circle,
                          ),
                          child: AppText(
                            '${step.step}',
                            style: font14w700.copyWith(
                              color: const Color(0xFF0A93C4),
                            ),
                            alignment: AlignmentDirectional.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            step.title,
                            style: font14w500.copyWith(
                              color: const Color(0xFF0F2B46),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          AppText(
                            step.subtitle,
                            style: font12w400.copyWith(
                              color: const Color(0xFF2E435B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
