import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_cubit.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_state.dart';
import 'package:waterrush/features/custoomer/address/presentation/widgets/address_item_card.dart';
import 'package:waterrush/features/custoomer/address/presentation/widgets/address_bottom_sheet.dart';

class AddressManagementBody extends StatelessWidget {
  const AddressManagementBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacing(16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFE4ECF7)),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new, size: 18),
                ),
              ),
              horizontalSpacing(16),
              AppText(
                'Saved Addresses',
                style: font20w700.copyWith(color: const Color(0xFF0F2B46)),
              ),
            ],
          ),
        ),
        verticalSpacing(24),
        Expanded(
          child: BlocConsumer<AddressCubit, AddressState>(
            listener: (context, state) {
              if (state.deleteStatus == AddressDeleteStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: AppText(state.deleteErrorMessage)),
                );
              }
              if (state.setDefaultStatus == AddressSetDefaultStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: AppText(state.setDefaultErrorMessage)),
                );
              }
            },
            builder: (context, state) {
              if (state.status == AddressStatus.loading) {
                return Center(child: CustomLoading.showLoader());
              } else if (state.status == AddressStatus.failure) {
                return Center(child: AppText(state.errorMessage));
              } else if (state.addresses.isEmpty) {
                return const Center(child: AppText('No saved addresses yet.'));
              }

              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                itemCount: state.addresses.length,
                separatorBuilder: (context, index) => verticalSpacing(12),
                itemBuilder: (context, index) {
                  final address = state.addresses[index];
                  return AddressItemCard(
                    address: address,
                    onSetDefault: () {
                      context.read<AddressCubit>().setDefaultAddress(
                        address.id,
                      );
                    },
                    onDelete: () {
                      context.read<AddressCubit>().deleteAddress(address.id);
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
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.w),
          child: AppButton(
            text: 'Add New Address',
            color: const Color(0xFF0F2B46),
            radius: 14.r,
            height: 54.h,
            textSize: 16.sp,
            textWeight: FontWeight.w700,
            onPressed: () {
              final cubit = context.read<AddressCubit>();
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (ctx) => BlocProvider.value(
                  value: cubit,
                  child: const AddressBottomSheet(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
