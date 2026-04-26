import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_nav_bar.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class NavBarPageAppBar extends StatelessWidget {
  const NavBarPageAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.leadingIcon = Icons.dashboard_rounded,
    this.trailing,
    this.margin,
    this.onTrailingTap,
    this.profileTabIndex = 4,
  });

  final String title;
  final String? subtitle;
  final IconData leadingIcon;
  final Widget? trailing;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTrailingTap;
  final int profileTabIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1C8FE8), Color(0xFF0D6BC8)],
        ),
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0D6BC8).withValues(alpha: 0.24),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(leadingIcon, color: Colors.white, size: 22.sp),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  title,
                  style: font18w700.copyWith(color: Colors.white),
                  maxLines: 1,
                ),
                if (subtitle != null) ...[
                  SizedBox(height: 2.h),
                  AppText(
                    subtitle!,
                    style: font12w500.copyWith(
                      color: Colors.white.withValues(alpha: 0.88),
                    ),
                    maxLines: 1,
                  ),
                ],
              ],
            ),
          ),
          trailing ??
              GestureDetector(
                onTap:
                    onTrailingTap ??
                    () {
                      CustomNavBar.switchToTab(context, profileTabIndex);
                    },
                child: Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11.r),
                  ),
                  child: Icon(
                    Icons.person_rounded,
                    size: 20.sp,
                    color: const Color(0xFF0D6BC8),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
