import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/utils/easy_loading.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_cubit.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_state.dart';
import 'package:waterrush/features/custoomer/address/presentation/widgets/address_item_card.dart';
import 'package:waterrush/features/custoomer/address/presentation/widgets/address_bottom_sheet.dart';
import 'package:waterrush/features/custoomer/address/presentation/widgets/address_delete_dialog.dart';

class AddressManagementList extends StatelessWidget {
  const AddressManagementList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listenWhen: (previous, current) {
        return previous.deleteStatus != current.deleteStatus ||
            previous.setDefaultStatus != current.setDefaultStatus;
      },
      listener: (context, state) {
        if (state.deleteStatus == AddressDeleteStatus.loading ||
            state.setDefaultStatus == AddressSetDefaultStatus.loading) {
          showLoading();
        } else if (state.deleteStatus == AddressDeleteStatus.failure) {
          hideLoading();
          showError(state.deleteErrorMessage);
        } else if (state.deleteStatus == AddressDeleteStatus.success) {
          hideLoading();
          showSuccess('Address deleted successfully');
        } else if (state.setDefaultStatus == AddressSetDefaultStatus.failure) {
          hideLoading();
          showError(state.setDefaultErrorMessage);
        } else if (state.setDefaultStatus == AddressSetDefaultStatus.success) {
          hideLoading();
          showSuccess('Default address updated');
        }
      },
      builder: (context, state) {
        if (state.status == AddressStatus.loading) {
          return Center(child: CustomLoading.showLoader());
        } else if (state.status == AddressStatus.failure) {
          return Center(child: AppText(state.errorMessage));
        } else if (state.addresses.isEmpty) {
          return const Center(
            child: AppText('No saved addresses yet.'),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: 22.w,
            vertical: 8.h,
          ),
          itemCount: state.addresses.length,
          separatorBuilder: (context, index) => verticalSpacing(12),
          itemBuilder: (context, index) {
            final address = state.addresses[index];
            return AddressItemCard(
              address: address,
              onSetDefault: () {
                context.read<AddressCubit>().setDefaultAddress(address.id);
              },
              onDelete: () {
                showDialog(
                  context: context,
                  builder: (dialogCtx) => AddressDeleteDialog(
                    onConfirm: () {
                      context.read<AddressCubit>().deleteAddress(address.id);
                    },
                  ),
                );
              },
              onEdit: () {
                final cubit = context.read<AddressCubit>();
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (ctx) => BlocProvider.value(
                    value: cubit,
                    child: AddressBottomSheet(initialAddress: address),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
