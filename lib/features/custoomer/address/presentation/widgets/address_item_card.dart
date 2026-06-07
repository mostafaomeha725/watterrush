import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/address/domain/entities/address_entity.dart';

class AddressItemCard extends StatelessWidget {
  final AddressEntity address;
  final VoidCallback onSetDefault;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const AddressItemCard({
    super.key,
    required this.address,
    required this.onSetDefault,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: address.isDefault ? const Color(0xFFF4F8FB) : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: address.isDefault
              ? const Color(0xFF0F2B46)
              : const Color(0xFFE4ECF7),
          width: address.isDefault ? 1.5 : 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFE4ECF7),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.location_on_rounded,
                  color: const Color(0xFF0F2B46),
                  size: 20.sp,
                ),
              ),
              horizontalSpacing(12),
              Expanded(
                child: AppText(
                  address.title,
                  style: font16w700.copyWith(color: const Color(0xFF0F2B46)),
                ),
              ),
              if (address.isDefault)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F2B46),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: AppText(
                    'Default',
                    style: font12w500.copyWith(color: Colors.white),
                  ),
                )
              else
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'default') {
                      onSetDefault();
                    } else if (value == 'edit') {
                      onEdit();
                    } else if (value == 'delete') {
                      onDelete();
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'default',
                      child: Text('Set as Default'),
                    ),
                    const PopupMenuItem(value: 'edit', child: Text('Edit')),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                  icon: const Icon(
                    Icons.more_vert_rounded,
                    color: Color(0xFF0F2B46),
                  ),
                ),
            ],
          ),
          verticalSpacing(12),
          AppText(
            address.address,
            style: font14w400.copyWith(color: const Color(0xFF7C8B99)),
          ),
          if (address.isDefault) ...[
            verticalSpacing(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onEdit,
                  child: AppText(
                    'Edit',
                    style: font14w500.copyWith(color: const Color(0xFF0F2B46)),
                  ),
                ),
                horizontalSpacing(24),
                GestureDetector(
                  onTap: onDelete,
                  child: AppText(
                    'Delete',
                    style: font14w500.copyWith(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
