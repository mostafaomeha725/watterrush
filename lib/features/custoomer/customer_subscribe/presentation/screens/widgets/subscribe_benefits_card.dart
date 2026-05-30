import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class SubscribeBenefitsCard extends StatelessWidget {
  const SubscribeBenefitsCard({super.key, required this.bullets});

  final List<String> bullets;

  static const List<IconData> _icons = <IconData>[
    Icons.water_drop_rounded,
    Icons.savings_rounded,
    Icons.local_shipping_rounded,
    Icons.pause_circle_filled_rounded,
  ];

  static const List<Color> _iconColors = <Color>[
    Color(0xFF60A5FA),
    Color(0xFF34D399),
    Color(0xFFA78BFA),
    Color(0xFFFBBF24),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: <Color>[Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: -40.h,
            right: -30.w,
            child: Container(
              width: 120.w,
              height: 120.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: <Color>[
                    Colors.white.withValues(alpha: 0.1),
                    Colors.white.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -50.h,
            left: -20.w,
            child: Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: <Color>[
                    Colors.white.withValues(alpha: 0.08),
                    Colors.white.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: <Color>[Color(0xFFFDE68A), Color(0xFFF59E0B)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(14.r),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: const Color(0xFFF59E0B).withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.star_rounded,
                      color: Colors.white,
                      size: 22.sp,
                    ),
                  ),
                  horizontalSpacing(14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppText(
                        'Why Subscribe?',
                        style: font18w700.copyWith(color: Colors.white),
                      ),
                      verticalSpacing(2),
                      AppText(
                        'Unlock exclusive member benefits',
                        style: font12w500.copyWith(
                          color: const Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacing(20),
              ...List<Widget>.generate(bullets.length, (int i) {
                final IconData icon = _icons[i % _icons.length];
                final Color color = _iconColors[i % _iconColors.length];
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 36.w,
                        height: 36.w,
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: color.withValues(alpha: 0.2),
                            width: 1,
                          ),
                        ),
                        child: Icon(icon, color: color, size: 18.sp),
                      ),
                      horizontalSpacing(14),
                      Expanded(
                        child: AppText(
                          bullets[i],
                          style: font14w500.copyWith(
                            color: const Color(0xFFE2E8F0),
                            height: 1.3,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}