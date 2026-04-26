import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/app_form_field.dart';
import 'package:waterrush/features/auth/presentation/cubit/otp_cubit.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField({required this.cubit, super.key});

  final OtpCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List<Widget>.generate(6, (index) {
        return SizedBox(
          width: 47.w,
          child: AppFormField(
            controller: cubit.controllers[index],
            hintText: '',
            keyboardType: TextInputType.number,
            textInputAction: index == 5
                ? TextInputAction.done
                : TextInputAction.next,
            textAlign: TextAlign.center,
            maxLength: 1,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            fillColor: Colors.white,
            borderColor: const Color(0xFFD7E3F5),
            focusedBorderColor: const Color(0xFF3B8DFF),
            radius: 12.r,
            contentPadding: EdgeInsets.symmetric(vertical: 13.h),
            onChanged: (value) {
              cubit.onOtpChanged(index, value);
              if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
              if (value.isNotEmpty && index < 5) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        );
      }),
    );
  }
}
