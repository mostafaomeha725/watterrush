import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/address/domain/entities/address_entity.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_cubit.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_state.dart';
import 'package:waterrush/features/custoomer/address/presentation/widgets/add_address_dialog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'address_selector_item_widget.dart';
import 'address_selector_add_new_widget.dart';
import 'delete_address_dialog.dart';

class CustomerHomeAddressSelector extends StatelessWidget {
  const CustomerHomeAddressSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressCubit, AddressState>(
      listenWhen: (previous, current) =>
          previous.setDefaultStatus != current.setDefaultStatus ||
          previous.deleteStatus != current.deleteStatus,
      listener: (context, state) {
        if (state.setDefaultStatus == AddressSetDefaultStatus.loading ||
            state.deleteStatus == AddressDeleteStatus.loading) {
          EasyLoading.show(
            status: state.deleteStatus == AddressDeleteStatus.loading
                ? 'Deleting address...'
                : 'Setting default address...',
          );
        } else {
          if (EasyLoading.isShow) EasyLoading.dismiss();
          if (state.setDefaultStatus == AddressSetDefaultStatus.success) {
            EasyLoading.showSuccess('Address changed successfully!');
          } else if (state.setDefaultStatus ==
              AddressSetDefaultStatus.failure) {
            EasyLoading.showError(state.setDefaultErrorMessage);
          } else if (state.deleteStatus == AddressDeleteStatus.success) {
            EasyLoading.showSuccess('Address deleted successfully!');
          } else if (state.deleteStatus == AddressDeleteStatus.failure) {
            EasyLoading.showError(state.deleteErrorMessage);
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Deliver to',
            style: font8w600.copyWith(color: const Color(0xFF7E8EA8)),
          ),
          BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              String addressText = 'Loading...';
              if (state.status == AddressStatus.success) {
                final selected = state.selectedAddress;
                if (selected != null) {
                  addressText = selected.title.isNotEmpty
                      ? '${selected.title}, ${selected.address}'
                      : selected.address;
                } else {
                  addressText = 'No address set';
                }
              } else if (state.status == AddressStatus.failure) {
                addressText = 'Failed to load address';
              }

              return Builder(
                builder: (menuContext) {
                  return GestureDetector(
                    onTap: () {
                      if (state.status == AddressStatus.success) {
                        final addressCubit = context.read<AddressCubit>();

                        if (state.addresses.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (_) => BlocProvider.value(
                              value: addressCubit,
                              child: const AddAddressDialog(),
                            ),
                          );
                          return;
                        }

                        final renderBox =
                            menuContext.findRenderObject() as RenderBox;
                        final size = renderBox.size;
                        final position = renderBox.localToGlobal(Offset.zero);

                        showMenu<dynamic>(
                          context: context,
                          position: RelativeRect.fromLTRB(
                            position.dx,
                            position.dy + size.height,
                            position.dx + size.width,
                            position.dy + size.height + 200,
                          ),
                          color: Colors.white,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          items: [
                            ...state.addresses.map((address) {
                              final isSelected =
                                  state.selectedAddress?.id == address.id;
                              return PopupMenuItem<dynamic>(
                                value: address,
                                padding: EdgeInsets.only(
                                  left: 16.w,
                                  right: 8.w,
                                ),
                                child: AddressSelectorItemWidget(
                                  address: address,
                                  isSelected: isSelected,
                                ),
                              );
                            }),
                            const PopupMenuDivider(),
                            const PopupMenuItem<dynamic>(
                              value: 'add_new',
                              child: AddressSelectorAddNewWidget(),
                            ),
                          ],
                        ).then((selectedValue) {
                          if (selectedValue is Map &&
                              selectedValue['action'] == 'edit') {
                            final AddressEntity address =
                                selectedValue['address'];
                            showDialog(
                              context: context,
                              builder: (_) => BlocProvider.value(
                                value: addressCubit,
                                child: AddAddressDialog(
                                  addressToUpdate: address,
                                ),
                              ),
                            );
                          } else if (selectedValue is Map &&
                              selectedValue['action'] == 'delete') {
                            final AddressEntity address =
                                selectedValue['address'];
                            showDialog(
                              context: context,
                              builder: (_) => DeleteAddressDialog(
                                address: address,
                                addressCubit: addressCubit,
                              ),
                            );
                          } else if (selectedValue is AddressEntity) {
                            addressCubit.selectAddress(selectedValue);
                            addressCubit.setDefaultAddress(selectedValue.id);
                          } else if (selectedValue == 'add_new') {
                            showDialog(
                              context: context,
                              builder: (_) => BlocProvider.value(
                                value: addressCubit,
                                child: const AddAddressDialog(),
                              ),
                            );
                          }
                        });
                      }
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 200.w, // Limit width so it doesn't overflow
                          child: AppText(
                            addressText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: font12w800.copyWith(
                              color: const Color(0xFF24385B),
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 14.sp,
                          color: const Color(0xFF6F84A6),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
