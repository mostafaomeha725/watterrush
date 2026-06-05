import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class AddressManagementHeader extends StatelessWidget {
  const AddressManagementHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            'Saved Addresses',
            style: font20w700.copyWith(color: const Color(0xFF0F2B46)),
          ),
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              padding: EdgeInsets.all(6.w),
              decoration: const BoxDecoration(
                color: Color(0xFFF4F8FB),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close_rounded, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
