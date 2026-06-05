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
import 'package:waterrush/core/utils/easy_loading.dart';
import 'package:waterrush/features/custoomer/address/presentation/widgets/address_item_card.dart';
import 'package:waterrush/features/custoomer/address/presentation/widgets/address_bottom_sheet.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/bottom_sheet_handle_bar.dart';

class AddressManagementBottomSheet extends StatelessWidget {
  const AddressManagementBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpacing(16),
          const BottomSheetHandleBar(),
          verticalSpacing(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  'Saved Addresses',
                  style: font20w700.copyWith(color: const Color(0xFF0F2B46)),
                ),
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F8FB),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close_rounded, size: 20),
                  ),
                ),
              ],
            ),
          ),
          verticalSpacing(16),
          Expanded(
            child: BlocConsumer<AddressCubit, AddressState>(
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
                } else if (state.setDefaultStatus ==
                    AddressSetDefaultStatus.failure) {
                  hideLoading();
                  showError(state.setDefaultErrorMessage);
                } else if (state.setDefaultStatus ==
                    AddressSetDefaultStatus.success) {
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
                        context.read<AddressCubit>().setDefaultAddress(
                          address.id,
                        );
                      },
                      onDelete: () {
                        showDialog(
                          context: context,
                          builder: (dialogCtx) => Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(24.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppText(
                                    'Confirm Deletion',
                                    style: font18w700.copyWith(
                                      color: const Color(0xFF0F2B46),
                                    ),
                                  ),
                                  verticalSpacing(12),
                                  AppText(
                                    'Are you sure you want to delete this address?',
                                    style: font14w400.copyWith(
                                      color: const Color(0xFF7C8B99),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  verticalSpacing(24),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppButton(
                                          text: 'Cancel',
                                          textSize: 16.sp,

                                          color: const Color(0xFFF4F8FB),
                                          textColor: const Color(0xFF7C8B99),
                                          onPressed: () =>
                                              Navigator.pop(dialogCtx),
                                          height: 48.h,
                                        ),
                                      ),
                                      horizontalSpacing(12),
                                      Expanded(
                                        child: AppButton(
                                          text: 'Delete',
                                          textSize: 16.sp,
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          onPressed: () {
                                            Navigator.pop(dialogCtx);
                                            context
                                                .read<AddressCubit>()
                                                .deleteAddress(address.id);
                                          },
                                          height: 48.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
            ),
          ),
          Padding(
            padding: EdgeInsets.all(22.w),
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
      ),
    );
  }
}
