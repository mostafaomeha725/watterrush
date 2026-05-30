import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/widgets/app_image.dart';

class ProfileAvatarStack extends StatelessWidget {
  const ProfileAvatarStack({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 110.w,
          height: 110.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4.w),
          ),
          child: ClipOval(
            child: AppImage(
              imageUrl: imageUrl,
              width: 110.w,
              height: 110.h,
              fit: BoxFit.cover,
              showprogressIndicator: false,
            ),
          ),
        ),
        Positioned(
          bottom: 6,
          right: 6,
          child: Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: const Color(0xFF2E8CF5),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: Icon(Icons.camera_alt, size: 16.sp, color: Colors.white),
          ),
        ),
      ],
    );
  }
}