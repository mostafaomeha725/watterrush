import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_role_option_content.dart';

class AuthRoleOptionCard extends StatelessWidget {
  const AuthRoleOptionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.gradient,
    this.backgroundColor,
    this.iconCircleColor,
    this.iconColor,
    this.titleColor,
    this.subtitleColor,
    this.trailingCircleColor,
    this.trailingIconColor,
    this.border,
    this.shadowColor,
    super.key,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final Gradient? gradient;
  final Color? backgroundColor;
  final Color? iconCircleColor;
  final Color? iconColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? trailingCircleColor;
  final Color? trailingIconColor;
  final BoxBorder? border;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    return BounceIt(
      onPressed: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: gradient == null
              ? (backgroundColor ?? const Color(0xFFEAF0F6))
              : null,
          gradient: gradient,
          borderRadius: BorderRadius.circular(18.r),
          border: border,
          boxShadow: [
            BoxShadow(
              color: (shadowColor ?? const Color(0xFF2B74CB)).withValues(
                alpha: gradient == null ? 0.10 : 0.20,
              ),
              blurRadius: gradient == null ? 16.r : 22.r,
              offset: Offset(0, 10.h),
            ),
          ],
        ),
        child: Stack(
          children: [
            if (gradient != null)
              Positioned(
                right: 6.w,
                bottom: 4.h,
                child: Opacity(
                  opacity: 0.28,
                  child: Container(
                    width: 92.w,
                    height: 34.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      gradient: const LinearGradient(
                        colors: [Color(0x40FFFFFF), Color(0x00FFFFFF)],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                    ),
                  ),
                ),
              ),
            AuthRoleOptionContent(
              title: title,
              subtitle: subtitle,
              icon: icon,
              iconCircleColor: iconCircleColor,
              iconColor: iconColor,
              titleColor: titleColor,
              subtitleColor: subtitleColor,
              trailingCircleColor: trailingCircleColor,
              trailingIconColor: trailingIconColor,
            ),
          ],
        ),
      ),
    );
  }
}
