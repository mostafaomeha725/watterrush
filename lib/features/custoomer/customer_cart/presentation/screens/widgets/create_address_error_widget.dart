import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CreateAddressErrorWidget extends StatelessWidget {
  final String errorMessage;

  const CreateAddressErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.red.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 20.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: AppText(
              errorMessage,
              style: font14w500.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
