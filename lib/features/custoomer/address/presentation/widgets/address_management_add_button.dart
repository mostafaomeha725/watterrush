import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/features/custoomer/address/presentation/cubit/address_cubit.dart';
import 'package:waterrush/features/custoomer/address/presentation/widgets/address_bottom_sheet.dart';

class AddressManagementAddButton extends StatelessWidget {
  const AddressManagementAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
