import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_trust_item.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_view_models.dart';

class CustomerHomeTrustRow extends StatelessWidget {
  const CustomerHomeTrustRow({
    required this.items,
    this.cardColor = Colors.white,
    this.isCompact = false,
    super.key,
  });

  final List<HomeTrustFeatureViewModel> items;
  final Color cardColor;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: isCompact ? 9.h : 8.h,
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE2EBF7)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFBED0E8).withValues(alpha: 0.1),
            blurRadius: 12.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Row(
        children: List<Widget>.generate(items.length * 2 - 1, (index) {
          if (index.isOdd) {
            return Container(
              width: 1.w,
              height: isCompact ? 30.h : 26.h,
              color: const Color(0xFFE7EEF8),
            );
          }
          final int itemIndex = index ~/ 2;
          return Expanded(
            child: CustomerHomeTrustItem(
              data: items[itemIndex],
              isCompact: isCompact,
            ),
          );
        }),
      ),
    );
  }
}