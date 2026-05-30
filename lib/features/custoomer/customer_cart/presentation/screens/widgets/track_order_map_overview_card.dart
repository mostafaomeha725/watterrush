import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class TrackOrderMapOverviewCard extends StatefulWidget {
  const TrackOrderMapOverviewCard({super.key});

  @override
  State<TrackOrderMapOverviewCard> createState() =>
      _TrackOrderMapOverviewCardState();
}

class _TrackOrderMapOverviewCardState extends State<TrackOrderMapOverviewCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _pinOffsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _pinOffsetAnimation = Tween<double>(begin: -6, end: 6).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220.h,
      decoration: BoxDecoration(
        color: const Color(0xFFC7DEEA),
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 14.w,
            top: 14.h,
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF0FA4D4),
              ),
              child: Icon(
                Icons.my_location_rounded,
                size: 16.sp,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _pinOffsetAnimation,
              builder: (context, _) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.translate(
                      offset: Offset(0, _pinOffsetAnimation.value),
                      child: Icon(
                        Icons.location_on_outlined,
                        size: 56.sp,
                        color: const Color(0xFFE7303F),
                      ),
                    ),
                    verticalSpacing(8),
                    SizedBox(
                      width: 125.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        child: AppText(
                          '2.5 km away',
                          style: font14w500.copyWith(
                            color: const Color(0xFF3A4D63),
                          ),
                          alignment: AlignmentDirectional.center,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}