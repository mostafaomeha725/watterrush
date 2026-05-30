import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class DriverDeliveryRejectReasonTile extends StatelessWidget {
  const DriverDeliveryRejectReasonTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BounceIt(
      onPressed: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7FC),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFD6DEEC)),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF2A6BC3)
                      : const Color(0xFF9CADC5),
                  width: 2.w,
                ),
                color: Colors.transparent,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF2A6BC3),
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: AppText(
                title,
                style: font16w500.copyWith(color: const Color(0xFF485B78)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}