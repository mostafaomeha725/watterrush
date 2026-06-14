import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class OrderTimelineStepWidget extends StatelessWidget {
  final String title;
  final String desc;
  final bool isCompleted;
  final bool isCurrent;
  final bool isLast;
  final Color? activeColor;

  const OrderTimelineStepWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.isCompleted,
    required this.isCurrent,
    required this.isLast,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = activeColor ?? const Color(0xFF0B48C6);
    Color iconColor = isCompleted || isCurrent
        ? themeColor
        : const Color(0xFFD9E0E8);
    Color textColor = isCompleted || isCurrent
        ? themeColor
        : const Color(0xFF0F2B46);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isCurrent
                        ? iconColor.withOpacity(0.3)
                        : Colors.transparent,
                    width: 4.w,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: isCompleted ? 16.w : 12.w,
                    height: isCompleted ? 16.w : 12.w,
                    decoration: BoxDecoration(
                      color: isCompleted ? iconColor : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isCompleted ? Colors.transparent : iconColor,
                        width: 2.w,
                      ),
                    ),
                    child: isCompleted
                        ? Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 10.sp,
                          )
                        : (isCurrent
                              ? Container(
                                  margin: EdgeInsets.all(2.r),
                                  decoration: BoxDecoration(
                                    color: iconColor,
                                    shape: BoxShape.circle,
                                  ),
                                )
                              : null),
                  ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2.w,
                    color: isCompleted ? iconColor : const Color(0xFFE4ECF7),
                  ),
                ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 24.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title,
                          style: font14w700.copyWith(color: textColor),
                        ),
                        SizedBox(height: 4.h),
                        AppText(
                          desc,
                          overflow: TextOverflow.visible,
                          style: font12w400.copyWith(
                            color: const Color(0xFF6F8097),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isCurrent)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: themeColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: AppText(
                        'Current',
                        style: font10w500.copyWith(
                          color: themeColor,
                        ),
                        alignment: AlignmentDirectional.center,
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
