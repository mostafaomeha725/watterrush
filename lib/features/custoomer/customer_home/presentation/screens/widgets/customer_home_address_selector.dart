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
      listenWhen: (previous, current) => 
        previous.setDefaultStatus != current.setDefaultStatus || 
        previous.deleteStatus != current.deleteStatus,
      listener: (context, state) {
        if (state.setDefaultStatus == AddressSetDefaultStatus.loading || state.deleteStatus == AddressDeleteStatus.loading) {
          EasyLoading.show(status: state.deleteStatus == AddressDeleteStatus.loading ? 'Deleting address...' : 'Setting default address...');
        } else {
          if (EasyLoading.isShow) EasyLoading.dismiss();
          if (state.setDefaultStatus == AddressSetDefaultStatus.success) {
            EasyLoading.showSuccess('Address changed successfully!');
          } else if (state.setDefaultStatus == AddressSetDefaultStatus.failure) {
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
                                width: 220.w, // Ensure it has enough width
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: AppText(address.title, style: font14w700.copyWith(color: const Color(0xFF24385B))),
                                  subtitle: AppText(address.address, maxLines: 2, overflow: TextOverflow.ellipsis, style: font10w500.copyWith(color: const Color(0xFF7E8EA8))),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (isSelected) ...[
                                        Icon(Icons.check_circle, color: const Color(0xFF0b48c6), size: 22.sp),
                                        SizedBox(width: 8.w),
                                      ],
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                        icon: Icon(Icons.delete_outline_rounded, color: Colors.redAccent, size: 22.sp),
                                        onPressed: () {
                                          Navigator.pop(context, {'action': 'delete', 'address': address});
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                          const PopupMenuDivider(),
                          PopupMenuItem<dynamic>(
                            value: 'add_new',
                            child: SizedBox(
                              width: 220.w,
                              child: Row(
                                children: [
                                  Icon(Icons.add_circle_outline_rounded, color: const Color(0xFF0b48c6), size: 22.sp),
                                  SizedBox(width: 8.w),
                                  AppText('Add New Address', style: font14w700.copyWith(color: const Color(0xFF0b48c6))),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ).then((selectedValue) {
                        if (selectedValue is Map && selectedValue['action'] == 'delete') {
                          final AddressEntity address = selectedValue['address'];
                          showDialog(
                            context: context,
                            builder: (dialogContext) => AlertDialog(
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
                                  onPressed: () => Navigator.pop(dialogContext),
                                  child: Text('Cancel', style: font14w700.copyWith(color: const Color(0xFF7E8EA8))),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(dialogContext);
                                    addressCubit.deleteAddress(address.id);
                                  },
                                  child: Text('Delete', style: font14w700.copyWith(color: Colors.redAccent)),
                                ),
                              ],
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
