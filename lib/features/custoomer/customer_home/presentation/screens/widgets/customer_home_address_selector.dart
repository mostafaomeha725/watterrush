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

class CustomerHomeAddressSelector extends StatelessWidget {
  const CustomerHomeAddressSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressCubit, AddressState>(
      listenWhen: (previous, current) => previous.setDefaultStatus != current.setDefaultStatus,
      listener: (context, state) {
        if (state.setDefaultStatus == AddressSetDefaultStatus.loading) {
          EasyLoading.show(status: 'Setting default address...');
        } else {
          if (EasyLoading.isShow) EasyLoading.dismiss();
          if (state.setDefaultStatus == AddressSetDefaultStatus.success) {
            EasyLoading.showSuccess('Address changed successfully!');
          } else if (state.setDefaultStatus == AddressSetDefaultStatus.failure) {
            EasyLoading.showError(state.setDefaultErrorMessage);
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
                    if (state.status == AddressStatus.success && state.addresses.isNotEmpty) {
                      final addressCubit = context.read<AddressCubit>();
                      final renderBox = menuContext.findRenderObject() as RenderBox;
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
                            final isSelected = state.selectedAddress?.id == address.id;
                            return PopupMenuItem<dynamic>(
                              value: address,
                              child: SizedBox(
                                width: 200.w, // Ensure it has enough width
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: AppText(address.title, style: font12w800.copyWith(color: const Color(0xFF24385B))),
                                  subtitle: AppText(address.address, maxLines: 2, overflow: TextOverflow.ellipsis, style: font8w600.copyWith(color: const Color(0xFF7E8EA8))),
                                  trailing: isSelected
                                      ? Icon(Icons.check_circle, color: const Color(0xFF0b48c6), size: 20.sp)
                                      : null,
                                ),
                              ),
                            );
                          }),
                          const PopupMenuDivider(),
                          PopupMenuItem<dynamic>(
                            value: 'add_new',
                            child: SizedBox(
                              width: 200.w,
                              child: Row(
                                children: [
                                  Icon(Icons.add_circle_outline_rounded, color: const Color(0xFF0b48c6), size: 20.sp),
                                  SizedBox(width: 8.w),
                                  AppText('Add New Address', style: font12w800.copyWith(color: const Color(0xFF0b48c6))),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ).then((selectedValue) {
                        if (selectedValue is AddressEntity) {
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
                        width: 150.w, // Limit width so it doesn't overflow
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
