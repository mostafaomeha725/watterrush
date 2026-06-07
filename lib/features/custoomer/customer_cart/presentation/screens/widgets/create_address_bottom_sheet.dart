import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/helpers/helpers.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/app_form_field.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_cubit.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_state.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/location_on_map_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/create_address_error_widget.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/bottom_sheet_handle_bar.dart';

class CreateAddressBottomSheet extends StatefulWidget {
  const CreateAddressBottomSheet({super.key});

  @override
  State<CreateAddressBottomSheet> createState() =>
      _CreateAddressBottomSheetState();
}

class _CreateAddressBottomSheetState extends State<CreateAddressBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _addressTextController = TextEditingController();

  String? _selectedMapAddress;
  String? _errorMessage;
  double? _selectedMapLatitude;
  double? _selectedMapLongitude;

  @override
  void dispose() {
    _titleController.dispose();
    _addressTextController.dispose();
    super.dispose();
  }

  void _saveAddress() {
    if (_titleController.text.trim().isEmpty) {
      setState(
        () => _errorMessage = 'Please enter a title (e.g. Home, Office)',
      );
      return;
    }
    if (_selectedMapLatitude == null || _selectedMapLongitude == null) {
      setState(() => _errorMessage = 'Please pick a location from the map');
      return;
    }
    if (_addressTextController.text.trim().isEmpty) {
      setState(() => _errorMessage = 'Please enter your address details');
      return;
    }

    setState(() => _errorMessage = null);

    context.read<AddressCubit>().createAddress(
      title: _titleController.text.trim(),
      address: _addressTextController.text.trim(),
      lat: _selectedMapLatitude!.toString(),
      lng: _selectedMapLongitude!.toString(),
      isDefault: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressCubit, AddressState>(
      listenWhen: (previous, current) =>
          previous.createStatus != current.createStatus,
      listener: (context, state) {
        if (state.createStatus == AddressCreateStatus.success) {
          Helpers.showSuccessSnack(
            context: context,
            message: 'Address added successfully',
          );
          Navigator.pop(context); // close bottom sheet
        } else if (state.createStatus == AddressCreateStatus.failure) {
          setState(() => _errorMessage = state.createErrorMessage);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const BottomSheetHandleBar(),
              verticalSpacing(20),
              AppText(
                'Add New Address',
                style: font18w700.copyWith(color: const Color(0xFF0F2B46)),
              ),
              verticalSpacing(16),
              AppFormField(
                controller: _titleController,
                hintText: 'Address Title (e.g. Home, Office)',
                fillColor: AppLightColors.defaultBackground,
                radius: 12.r,
                borderColor: const Color(0xFFD2D8E1),
                borderWidth: 1,
              ),
              verticalSpacing(16),
              AppText(
                'Select Location',
                style: font16w500.copyWith(color: const Color(0xFF0F2B46)),
              ),
              verticalSpacing(10),
              LocationOnMapCard(
                initialLatitude: _selectedMapLatitude,
                initialLongitude: _selectedMapLongitude,
                initialAddress: _selectedMapAddress,
                onAddressSelected: (address) {
                  setState(() {
                    _selectedMapAddress = address;
                    _addressTextController.text = address;
                  });
                },
                onLocationSelected: (lat, lng) {
                  setState(() {
                    _selectedMapLatitude = lat;
                    _selectedMapLongitude = lng;
                  });
                },
              ),
              verticalSpacing(16),
              AppText(
                'Address Details',
                style: font16w500.copyWith(color: const Color(0xFF0F2B46)),
              ),
              verticalSpacing(10),
              AppFormField(
                controller: _addressTextController,
                hintText: 'Enter full address',
                fillColor: AppLightColors.defaultBackground,
                radius: 12.r,
                borderColor: const Color(0xFFD2D8E1),
                borderWidth: 1,
                minLines: 2,
                maxLines: 3,
              ),
              verticalSpacing(24),
              if (_errorMessage != null) ...[
                CreateAddressErrorWidget(errorMessage: _errorMessage!),
                verticalSpacing(16),
              ],
              BlocBuilder<AddressCubit, AddressState>(
                builder: (context, state) {
                  return AppButton(
                    text: state.createStatus == AddressCreateStatus.loading
                        ? 'Saving...'
                        : 'Save Address',
                    color: AppLightColors.buttonColor,
                    textSize: 16.sp,
                    textWeight: FontWeight.w700,
                    radius: 14.r,
                    onPressed: state.createStatus == AddressCreateStatus.loading
                        ? () {}
                        : _saveAddress,
                  );
                },
              ),
              verticalSpacing(10),
            ],
          ),
        ),
      ),
    );
  }
}
