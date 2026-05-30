import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_subscribe/presentation/screens/widgets/subscribe_option_models.dart';

class SubscribeFrequencyCard extends StatelessWidget {
  const SubscribeFrequencyCard({
    super.key,
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final SubscribeFrequencyOption option;
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
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: selected
                    ? _primary.withValues(alpha: 0.1)
                    : const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Icon(
                Icons.event_repeat_rounded,
                size: 24.sp,
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
                  verticalSpacing(4),
                  AppText(
                    option.cadence,
                    style: font12w500.copyWith(
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
            horizontalSpacing(10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                gradient: selected
                    ? const LinearGradient(
                        colors: <Color>[Color(0xFF3B82F6), Color(0xFF2563EB)],
                      )
                    : null,
                color: selected ? null : const Color(0xFFECFDF5),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: AppText(
                option.discount,
                style: font12w700.copyWith(
                  color: selected ? Colors.white : const Color(0xFF059669),
                ),
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
                  color: selected ? Colors.transparent : const Color(0xFFCBD5E1),
                  width: 2,
                ),
              ),
              child: selected
                  ? Icon(
                      Icons.check_rounded,
                      size: 14.sp,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}