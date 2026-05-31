import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/address/domain/entities/address_entity.dart';

class AddressSelectorItemWidget extends StatelessWidget {
  final AddressEntity address;
  final bool isSelected;

  const AddressSelectorItemWidget({
    super.key,
    required this.address,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.w, // Ensure it has enough width
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: AppText(
          address.title,
          style: font14w700.copyWith(color: const Color(0xFF24385B)),
        ),
        subtitle: AppText(
          address.address,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: font10w500.copyWith(color: const Color(0xFF7E8EA8)),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              Icon(
                Icons.check_circle,
                color: const Color(0xFF0b48c6),
                size: 22.sp,
              ),
              SizedBox(width: 8.w),
            ],
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                Icons.edit_outlined,
                color: const Color(0xFF0b48c6),
                size: 22.sp,
              ),
              onPressed: () {
                Navigator.pop(context, {'action': 'edit', 'address': address});
              },
            ),
            SizedBox(width: 8.w),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                Icons.delete_outline_rounded,
                color: Colors.redAccent,
                size: 22.sp,
              ),
              onPressed: () {
                Navigator.pop(context, {
                  'action': 'delete',
                  'address': address,
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
