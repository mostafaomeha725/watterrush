import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_address_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/location_on_map_card.dart';

class CheckoutSavedAddressesSection extends StatelessWidget {
  const CheckoutSavedAddressesSection({
    super.key,
    required this.isHomeSelected,
    this.selectedMapAddress,
    this.selectedMapCoordinates,
    this.selectedMapLatitude,
    this.selectedMapLongitude,
    required this.onHomeTap,
    required this.onOfficeTap,
    required this.onAddAddressTap,
    required this.onAddressSelected,
    required this.onLocationSelected,
  });

  final bool isHomeSelected;
  final String? selectedMapAddress;
  final String? selectedMapCoordinates;
  final double? selectedMapLatitude;
  final double? selectedMapLongitude;
  final VoidCallback onHomeTap;
  final VoidCallback onOfficeTap;
  final VoidCallback onAddAddressTap;
  final void Function(String address) onAddressSelected;
  final void Function(double latitude, double longitude) onLocationSelected;

  @override
  Widget build(BuildContext context) {
    final bool hasSelectedMapAddress =
        selectedMapAddress != null && selectedMapAddress!.trim().isNotEmpty;
    final bool hasSelectedMapCoordinates =
        selectedMapCoordinates != null &&
        selectedMapCoordinates!.trim().isNotEmpty;

    final String homeAddress = hasSelectedMapAddress
        ? selectedMapAddress!
        : hasSelectedMapCoordinates
        ? selectedMapCoordinates!
        : '123 Main Street, Apt 4B';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'Saved Addresses',
          style: font18w700.copyWith(color: const Color(0xFF0F2B46)),
        ),
        verticalSpacing(12),
        CheckoutAddressCard(
          title: 'Home',
          address: homeAddress,
          icon: Icons.home_outlined,
          isSelected: isHomeSelected,
          onTap: onHomeTap,
        ),
        verticalSpacing(10),
        CheckoutAddressCard(
          title: 'Office',
          address: '456 Business Ave, Floor 2',
          icon: Icons.work_outline_rounded,
          isSelected: !isHomeSelected,
          onTap: onOfficeTap,
        ),
        verticalSpacing(10),
        AppButton(
          text: '+  Add New Address',
          onPressed: onAddAddressTap,
          color: Colors.white,
          textColor: const Color(0xFF556A80),
          borderColor: const Color(0xFFD2D8E1),
          // side: const BorderSide(width: 1, color: Color(0xFFD2D8E1)),
          radius: 30.r,
          textSize: 15.sp,
          textWeight: FontWeight.w500,
        ),
        verticalSpacing(18),
        LocationOnMapCard(
          initialLatitude: selectedMapLatitude,
          initialLongitude: selectedMapLongitude,
          initialAddress: selectedMapAddress ?? selectedMapCoordinates,
          onAddressSelected: onAddressSelected,
          onLocationSelected: onLocationSelected,
        ),
      ],
    );
  }
}