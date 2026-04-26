import 'package:flutter/material.dart';
import 'package:waterrush/core/utils/app_date_time.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/bouncing_widgets.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class OtpResendSection extends StatelessWidget {
  const OtpResendSection({
    required this.canResend,
    required this.remainingSeconds,
    required this.onResend,
    super.key,
  });

  final bool canResend;
  final int remainingSeconds;
  final VoidCallback onResend;

  @override
  Widget build(BuildContext context) {
    if (canResend) {
      return BounceIt(
        onPressed: onResend,
        child: AppText(
          'Resend code',
          alignment: AlignmentDirectional.center,
          style: font14w500.copyWith(
            color: const Color(0xFF318CFF),
            decoration: TextDecoration.underline,
            decorationColor: const Color(0xFF318CFF),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          'Resend code in ',
          style: font14w500.copyWith(color: const Color(0xFF9BA9C2)),
        ),
        AppText(
          AppDateTime.formatDuration(remainingSeconds),
          style: font14w700.copyWith(color: const Color(0xFF2D83FF)),
        ),
      ],
    );
  }
}
