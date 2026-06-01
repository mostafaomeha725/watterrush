import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:waterrush/core/helpers/helpers.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_cubit.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_state.dart';
import 'package:waterrush/features/custoomer/customer_cart/domain/usecases/place_order_usecase.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/checkout_cubit/checkout_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/checkout_cubit/checkout_state.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_delivery_instructions_section.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_delivery_time_section.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_header.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/checkout_saved_addresses_section.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/create_address_bottom_sheet.dart';

class CheckoutScreenBody extends StatefulWidget {
  final String? promoCode;
  const CheckoutScreenBody({super.key, this.promoCode});

  @override
  State<CheckoutScreenBody> createState() => _CheckoutScreenBodyState();
}

class _CheckoutScreenBodyState extends State<CheckoutScreenBody> {
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();

  bool _isScheduleSelected = false;
  
  int? _selectedScheduledTimeId;
  int? _selectedAddressId;

  @override
  void dispose() {
    _dateTimeController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _dateTimeController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _proceedToPayment(BuildContext context) {
    if (_selectedAddressId == null) {
      Helpers.showErrorSnack(context: context, message: 'Please select a delivery address');
      return;
    }

    if (_isScheduleSelected) {
      if (_dateTimeController.text.isEmpty) {
        Helpers.showErrorSnack(context: context, message: 'Please select a delivery date');
        return;
      }
      if (_selectedScheduledTimeId == null) {
        Helpers.showErrorSnack(context: context, message: 'Please select a scheduled time slot');
        return;
      }
    } else {
      _dateTimeController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final state = context.read<CheckoutCubit>().state;
      if (state.scheduledTimes.isNotEmpty) {
        _selectedScheduledTimeId = state.scheduledTimes.first.id;
      } else {
        _selectedScheduledTimeId = 1;
      }
    }

    final params = PlaceOrderParams(
      addressId: _selectedAddressId!,
      deliveryDate: _dateTimeController.text,
      scheduledTimeId: _selectedScheduledTimeId!,
      paymentMethod: 'cod',
      promoCode: widget.promoCode,
      notes: _instructionsController.text.trim(),
    );

    context.read<CheckoutCubit>().placeOrder(params);
  }

  void _showAddAddressBottomSheet(BuildContext context) {
    final cubit = context.read<AddressCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BlocProvider.value(
        value: cubit,
        child: const CreateAddressBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state.placeOrderStatus == CheckoutStatus.failure) {
          Helpers.showErrorSnack(context: context, message: state.placeOrderMessage);
        } else if (state.placeOrderStatus == CheckoutStatus.success) {
          Helpers.showSuccessSnack(context: context, message: 'Order created successfully!');
          context.go(Routes.mainNavigationScreen, extra: true);
        }
      },
      builder: (context, state) {
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
                          scheduledTimes: state.scheduledTimes,
                          selectedScheduledTimeId: _selectedScheduledTimeId,
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
                          onDateTimeTap: () => _selectDate(context),
                          onScheduledTimeSelected: (id) {
                            setState(() {
                              _selectedScheduledTimeId = id;
                            });
                          },
                        ),
                        verticalSpacing(24),
                        BlocBuilder<AddressCubit, AddressState>(
                          builder: (context, addressState) {
                            if (addressState.status == AddressStatus.loading && addressState.addresses.isEmpty) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            
                            // Auto select the default address if nothing is selected
                            if (_selectedAddressId == null) {
                              if (addressState.selectedAddress != null) {
                                _selectedAddressId = addressState.selectedAddress!.id;
                              } else if (addressState.addresses.isNotEmpty) {
                                _selectedAddressId = addressState.addresses.first.id;
                              }
                            }

                            return CheckoutSavedAddressesSection(
                              addresses: addressState.addresses,
                              selectedAddressId: _selectedAddressId,
                              onAddressSelected: (id) {
                                setState(() {
                                  _selectedAddressId = id;
                                });
                              },
                              onAddAddressTap: () {
                                _showAddAddressBottomSheet(context);
                              },
                            );
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
                    text: state.placeOrderStatus == CheckoutStatus.loading 
                        ? 'Placing Order...' 
                        : 'Continue to Payment / Place Order',
                    color: AppLightColors.buttonColor,
                    textSize: 16.sp,
                    textWeight: FontWeight.w700,
                    radius: 14.r,
                    onPressed: state.placeOrderStatus == CheckoutStatus.loading 
                        ? () {} 
                        : () => _proceedToPayment(context),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}