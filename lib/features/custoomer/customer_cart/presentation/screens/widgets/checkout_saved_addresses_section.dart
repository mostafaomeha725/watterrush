import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/address/domain/entities/address_entity.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_address_card.dart';

class CheckoutSavedAddressesSection extends StatelessWidget {
  const CheckoutSavedAddressesSection({
    super.key,
    required this.addresses,
    required this.selectedAddressId,
    required this.onAddAddressTap,
    required this.onAddressSelected,
  });

  final List<AddressEntity> addresses;
  final int? selectedAddressId;
  final VoidCallback onAddAddressTap;
  final void Function(int id) onAddressSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'Saved Addresses',
          style: font18w700.copyWith(color: const Color(0xFF0F2B46)),
        ),
        verticalSpacing(12),
        if (addresses.isEmpty) ...[
           AppText(
             'No saved addresses found. Please add a new address.',
             style: font14w400.copyWith(color: Colors.grey),
           ),
           verticalSpacing(10),
        ] else ...[
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: addresses.length,
            separatorBuilder: (context, index) => verticalSpacing(10),
            itemBuilder: (context, index) {
              final address = addresses[index];
              return CheckoutAddressCard(
                title: address.title,
                address: address.address,
                icon: address.title.toLowerCase().contains('office') 
                    ? Icons.work_outline_rounded 
                    : Icons.home_outlined,
                isSelected: address.id == selectedAddressId,
                onTap: () => onAddressSelected(address.id),
              );
            },
          ),
          verticalSpacing(10),
        ],
        AppButton(
          text: '+  Add New Address',
          onPressed: onAddAddressTap,
          color: Colors.white,
          textColor: const Color(0xFF556A80),
          borderColor: const Color(0xFFD2D8E1),
          radius: 30.r,
          textSize: 15.sp,
          textWeight: FontWeight.w500,
        ),
      ],
    );
  }
}