import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/features/custoomer/address/domain/entities/address_entity.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_cubit.dart';

class DeleteAddressDialog extends StatelessWidget {
  final AddressEntity address;
  final AddressCubit addressCubit;

  const DeleteAddressDialog({
    super.key,
    required this.address,
    required this.addressCubit,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Text(
        'Delete Address',
        style: font14w700.copyWith(color: const Color(0xFF24385B)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Are you sure you want to delete ${address.title}?',
            style: font12w500.copyWith(color: const Color(0xFF7E8EA8)),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: font14w700.copyWith(color: const Color(0xFF7E8EA8)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            addressCubit.deleteAddress(address.id);
          },
          child: Text(
            'Delete',
            style: font14w700.copyWith(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }
}
