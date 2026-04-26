import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_view_models.dart';

class CustomerHomeTrustItem extends StatelessWidget {
  const CustomerHomeTrustItem({
    required this.data,
    required this.isCompact,
    super.key,
  });

  final HomeTrustFeatureViewModel data;
  final bool isCompact;

  IconData _resolveIcon() {
    switch (data.icon) {
      case 'bolt':
        return Icons.bolt_rounded;
      case 'shield':
        return Icons.shield_rounded;
      case 'drop':
        return Icons.water_drop_rounded;
      case 'support':
        return Icons.support_agent_rounded;
      case 'truck':
        return Icons.local_shipping_rounded;
      case 'badge':
        return Icons.verified_rounded;
      case 'swap':
        return Icons.swap_horiz_rounded;
      default:
        return Icons.lock_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _resolveIcon(),
          size: isCompact ? 12.sp : 14.sp,
          color: const Color(0xFF2F86EF),
        ),
        SizedBox(height: 3.h),
        AppText(
          data.title,
          alignment: AlignmentDirectional.center,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontSize: isCompact ? 6.8.sp : 7.2.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF2D4163),
          ),
        ),
        SizedBox(height: 1.h),
        AppText(
          data.subtitle,
          alignment: AlignmentDirectional.center,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontSize: isCompact ? 5.8.sp : 6.2.sp,
            color: const Color(0xFF8195B0),
          ),
        ),
      ],
    );
  }
}
