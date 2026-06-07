import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_subscribe/presentation/screens/widgets/subscribe_option_models.dart';

class SubscribeProductCard extends StatelessWidget {
  const SubscribeProductCard({
    super.key,
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final SubscribeProductOption option;
  final bool selected;
  final VoidCallback onTap;

  static const Color _primary = Color(0xFF3B82F6);
  static const Color _primaryLight = Color(0xFFEFF6FF);

  @override
  Widget build(BuildContext context) {
    return BounceIt(
      onPressed: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: selected ? _primaryLight : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected ? _primary : const Color(0xFFF1F5F9),
            width: selected ? 2 : 1.5,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: selected
                  ? _primary.withValues(alpha: 0.15)
                  : const Color(0xFF0F172A).withValues(alpha: 0.04),
              blurRadius: 16.r,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 54.w,
              height: 54.w,
              decoration: BoxDecoration(
                color: selected
                    ? _primary.withValues(alpha: 0.1)
                    : const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(
                option.icon,
                size: 26.sp,
                color: selected ? _primary : const Color(0xFF94A3B8),
              ),
            ),
            horizontalSpacing(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    option.title,
                    style: font16w700.copyWith(
                      color: selected ? _primary : const Color(0xFF1E293B),
                    ),
                  ),
                  verticalSpacing(6),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981).withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.attach_money_rounded,
                          size: 12.sp,
                          color: const Color(0xFF10B981),
                        ),
                      ),
                      horizontalSpacing(6),
                      Expanded(
                        child: AppText(
                          option.priceLabel,
                          style: font14w700.copyWith(
                            color: const Color(0xFF10B981),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            horizontalSpacing(14),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: selected
                    ? const LinearGradient(
                        colors: <Color>[Color(0xFF3B82F6), Color(0xFF2563EB)],
                      )
                    : null,
                color: selected ? null : Colors.transparent,
                border: Border.all(
                  color: selected
                      ? Colors.transparent
                      : const Color(0xFFCBD5E1),
                  width: 2,
                ),
              ),
              child: selected
                  ? Icon(Icons.check_rounded, size: 14.sp, color: Colors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
