import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class AddressDeleteDialog extends StatelessWidget {
  const AddressDeleteDialog({super.key, required this.onConfirm});

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              'Confirm Deletion',
              style: font18w700.copyWith(color: const Color(0xFF0F2B46)),
            ),
            verticalSpacing(12),
            AppText(
              'Are you sure you want to delete this address?',
              style: font14w400.copyWith(color: const Color(0xFF7C8B99)),
              textAlign: TextAlign.center,
            ),
            verticalSpacing(24),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: 'Cancel',
                    textSize: 16.sp,
                    color: const Color(0xFFF4F8FB),
                    textColor: const Color(0xFF7C8B99),
                    onPressed: () => Navigator.pop(context),
                    height: 48.h,
                  ),
                ),
                horizontalSpacing(12),
                Expanded(
                  child: AppButton(
                    text: 'Delete',
                    textSize: 16.sp,
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm();
                    },
                    height: 48.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
