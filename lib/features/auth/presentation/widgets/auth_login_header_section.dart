import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_type_logo_section.dart';

class AuthLoginHeaderSection extends StatelessWidget {
  const AuthLoginHeaderSection({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTypeLogoSection(height: 134.h),
        SizedBox(height: 8.h),
        AppText(
          title,
          alignment: AlignmentDirectional.center,
          style: font26w700.copyWith(color: const Color(0xFF102E64)),
        ),
        SizedBox(height: 8.h),
        AppText(
          subtitle,
          alignment: AlignmentDirectional.center,
          style: font14w500.copyWith(color: const Color(0xFF7D8DAA)),
        ),
      ],
    );
  }
}