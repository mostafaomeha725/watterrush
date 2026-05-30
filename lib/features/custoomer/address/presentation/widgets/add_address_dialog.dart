import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_form_field.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_cubit.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_state.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/location_on_map_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AddAddressDialog extends StatefulWidget {
  const AddAddressDialog({super.key});

  @override
  State<AddAddressDialog> createState() => _AddAddressDialogState();
}

class _AddAddressDialogState extends State<AddAddressDialog> {
  final _titleController = TextEditingController();
  final _addressController = TextEditingController();
  bool _isDefault = true;
  LatLng? _selectedLocation;

  @override
  void dispose() {
    _titleController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressCubit, AddressState>(
      listenWhen: (previous, current) => previous.createStatus != current.createStatus,
      listener: (context, state) {
        if (state.createStatus == AddressCreateStatus.loading) {
          EasyLoading.show(status: 'Saving address...');
        } else {
          if (EasyLoading.isShow) EasyLoading.dismiss();
          
          if (state.createStatus == AddressCreateStatus.success) {
            EasyLoading.showSuccess('Address added successfully!');
            Navigator.pop(context);
          } else if (state.createStatus == AddressCreateStatus.failure) {
            EasyLoading.showError(state.createErrorMessage);
          }
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.add_location_alt_rounded, color: const Color(0xFF0b48c6), size: 24.sp),
                  SizedBox(width: 8.w),
                  AppText('Add New Address', style: font16w700.copyWith(color: const Color(0xFF24385B))),
                ],
              ),
              SizedBox(height: 24.h),
              AppFormField(
                controller: _titleController,
                hintText: 'Title (e.g., Home, Work)',
                fillColor: const Color(0xFFF8F9FA),
                focusedBorderColor: const Color(0xFF0b48c6),
                radius: 12.r,
              ),
              SizedBox(height: 16.h),
              AppFormField(
                controller: _addressController,
                hintText: 'Address Details',
                fillColor: const Color(0xFFF8F9FA),
                focusedBorderColor: const Color(0xFF0b48c6),
                radius: 12.r,
                maxLines: 2,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Checkbox(
                    value: _isDefault,
                    onChanged: (val) => setState(() => _isDefault = val ?? false),
                    activeColor: const Color(0xFF0b48c6),
                  ),
                  AppText('Set as default address', style: font12w800.copyWith(color: const Color(0xFF24385B))),
                ],
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () async {
                  final dynamic result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LocationOnMapScreen()),
                  );
                  if (result != null && result is Map<String, dynamic>) {
                    setState(() {
                      _selectedLocation = LatLng(
                        result['latitude'] as double,
                        result['longitude'] as double,
                      );
                      final address = result['address'] as String?;
                      if (address != null && address.isNotEmpty) {
                        _addressController.text = address;
                      }
                    });
                  }
                },
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF0b48c6)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map_outlined, color: const Color(0xFF0b48c6), size: 20.sp),
                      SizedBox(width: 8.w),
                      AppText(
                        _selectedLocation == null ? 'Pick Location on Map' : 'Location Selected ✓',
                        style: font12w800.copyWith(color: const Color(0xFF0b48c6)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: BlocBuilder<AddressCubit, AddressState>(
                  builder: (context, state) {
                    final isLoading = state.createStatus == AddressCreateStatus.loading;
                    return AppButton(
                      text: 'Save Address',
                      onPressed: isLoading
                          ? null
                          : () {
                              if (_titleController.text.trim().isEmpty || _addressController.text.trim().isEmpty) {
                                EasyLoading.showInfo('Please fill all fields');
                                return;
                              }
                              
                              if (_selectedLocation == null) {
                                EasyLoading.showInfo('Please pick a location on the map');
                                return;
                              }
                              
                              context.read<AddressCubit>().createAddress(
                                    title: _titleController.text.trim(),
                                    address: _addressController.text.trim(),
                                    lat: _selectedLocation!.latitude.toString(),
                                    lng: _selectedLocation!.longitude.toString(),
                                    isDefault: _isDefault,
                                  );
                            },
                      color: const Color(0xFF0b48c6),
                      textColor: Colors.white,
                      textSize: 16.sp,
                      textWeight: FontWeight.w700,
                      radius: 12.r,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
