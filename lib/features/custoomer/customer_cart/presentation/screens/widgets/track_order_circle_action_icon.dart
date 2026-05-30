import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackOrderCircleActionIcon extends StatelessWidget {
  const TrackOrderCircleActionIcon({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34.w,
        height: 34.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFE2F3FA),
        ),
        child: Icon(icon, size: 18.sp, color: const Color(0xFF2488AC)),
      ),
    );
  }
}