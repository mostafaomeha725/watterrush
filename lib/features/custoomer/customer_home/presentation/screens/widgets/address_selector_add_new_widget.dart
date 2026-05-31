import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class AddressSelectorAddNewWidget extends StatelessWidget {
  const AddressSelectorAddNewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220.w,
      child: Row(
        children: [
          Icon(
            Icons.add_circle_outline_rounded,
            color: const Color(0xFF0b48c6),
            size: 22.sp,
          ),
          SizedBox(width: 8.w),
          AppText(
            'Add New Address',
            style: font14w700.copyWith(
              color: const Color(0xFF0b48c6),
            ),
          ),
        ],
      ),
    );
  }
}
