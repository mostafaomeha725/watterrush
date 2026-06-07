import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class DriverDeliveryTimelineStepRow extends StatelessWidget {
  const DriverDeliveryTimelineStepRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isActive,
    required this.isCompleted,
    required this.showConnector,
  });

  final String title;
  final String subtitle;
  final bool isActive;
  final bool isCompleted;
  final bool showConnector;

  static const Color _activeBlue = Color(0xFF1E6FD8);
  static const Color _pendingOuter = Color(0xFFEAF0FA);
  static const Color _pendingInner = Color(0xFF9EAEC4);
  static const Color _connector = Color(0xFFDCE4F1);

  Color get _titleColor {
    if (isActive || isCompleted) {
      return const Color(0xFF0C3C88);
    }
    return const Color(0xFF9AA9BF);
  }

  Color get _outerNodeColor {
    if (isActive || isCompleted) {
      return _activeBlue;
    }
    return _pendingOuter;
  }

  Color get _innerNodeColor {
    if (isActive || isCompleted) {
      return Colors.white;
    }
    return _pendingInner;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 30.w,
          child: Column(
            children: <Widget>[
              Container(
                width: 20.w,
                height: 20.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _outerNodeColor,
                  boxShadow: isActive
                      ? <BoxShadow>[
                          BoxShadow(
                            color: _activeBlue.withValues(alpha: 0.22),
                            blurRadius: 8.r,
                            offset: Offset(0, 2.h),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Container(
                    width: 7.w,
                    height: 7.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _innerNodeColor,
                    ),
                  ),
                ),
              ),
              if (showConnector)
                Container(width: 2.w, height: 40.h, color: _connector),
            ],
          ),
        ),
        horizontalSpacing(8),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppText(title, style: font20w700.copyWith(color: _titleColor)),
                AppText(
                  subtitle,
                  style: font14w500.copyWith(color: const Color(0xFF9AA9BF)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
