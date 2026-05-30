import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/helpers/helpers.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_delivery_instructions_section.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_delivery_time_section.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_header.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_saved_addresses_section.dart';

class CheckoutScreenBody extends StatefulWidget {
  const CheckoutScreenBody({super.key});

  @override
  State<CheckoutScreenBody> createState() => _CheckoutScreenBodyState();
}

class _CheckoutScreenBodyState extends State<CheckoutScreenBody> {
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();

  bool _isScheduleSelected = false;
  bool _isHomeSelected = true;
  String? _selectedMapAddress;
  String? _selectedMapCoordinates;
  double? _selectedMapLatitude;
  double? _selectedMapLongitude;

  @override
  void dispose() {
    _dateTimeController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CheckoutHeader(
                      onBackTap: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    verticalSpacing(16),
                    CheckoutDeliveryTimeSection(
                      isScheduleSelected: _isScheduleSelected,
                      dateTimeController: _dateTimeController,
                      onDeliverNowTap: () {
                        setState(() {
                          _isScheduleSelected = false;
                        });
                      },
                      onScheduleTap: () {
                        setState(() {
                          _isScheduleSelected = true;
                        });
                      },
                      onDateTimeTap: () {
                        Helpers.pickCheckoutDeliveryDateAndTime(
                          context: context,
                          controller: _dateTimeController,
                        );
                      },
                    ),
                    verticalSpacing(24),
                    CheckoutSavedAddressesSection(
                      isHomeSelected: _isHomeSelected,
                      selectedMapAddress: _selectedMapAddress,
                      selectedMapCoordinates: _selectedMapCoordinates,
                      selectedMapLatitude: _selectedMapLatitude,
                      selectedMapLongitude: _selectedMapLongitude,
                      onHomeTap: () {
                        setState(() {
                          _isHomeSelected = true;
                        });
                      },
                      onOfficeTap: () {
                        setState(() {
                          _isHomeSelected = false;
                        });
                      },
                      onAddAddressTap: () {
                        Helpers.showSuccessSnack(
                          context: context,
                          message: 'Address flow can be connected here.',
                        );
                      },
                      onAddressSelected: (address) {
                        setState(() {
                          _selectedMapAddress = address;
                        });
                      },
                      onLocationSelected: (latitude, longitude) {
                        setState(() {
                          _selectedMapLatitude = latitude;
                          _selectedMapLongitude = longitude;
                          _selectedMapCoordinates =
                              Helpers.formatMapCoordinates(
                                latitude: latitude,
                                longitude: longitude,
                              );
                        });
                      },
                    ),
                    verticalSpacing(24),
                    CheckoutDeliveryInstructionsSection(
                      controller: _instructionsController,
                    ),
                    verticalSpacing(18),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
              child: AppButton(
                text: 'Continue to Payment',
                color: AppLightColors.buttonColor,
                textSize: 16.sp,
                textWeight: FontWeight.w700,
                radius: 14.r,
                onPressed: () {
                  Helpers.proceedToPayment(
                    context: context,
                    isScheduleSelected: _isScheduleSelected,
                    dateTimeController: _dateTimeController,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}