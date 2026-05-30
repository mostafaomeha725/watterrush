import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/cubit/driver_delivery_details_cubit.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/cubit/driver_delivery_details_state.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_models.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/driver_delivery_reject_reason_tile.dart';

class DriverDeliveryRejectSheet extends StatelessWidget {
  const DriverDeliveryRejectSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: EdgeInsets.fromLTRB(18.w, 10.h, 18.w, 18.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(34.r)),
        ),
        child:
            BlocBuilder<DriverDeliveryDetailsCubit, DriverDeliveryDetailsState>(
              builder:
                  (BuildContext context, DriverDeliveryDetailsState state) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Container(
                            width: 54.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD8E0EE),
                              borderRadius: BorderRadius.circular(999.r),
                            ),
                          ),
                        ),
                        verticalSpacing(16),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.cancel_outlined,
                              color: const Color(0xFFE34F5F),
                              size: 21.sp,
                            ),
                            horizontalSpacing(8),
                            AppText(
                              'Reject this order',
                              style: font20w700.copyWith(
                                color: const Color(0xFF122D53),
                              ),
                            ),
                          ],
                        ),
                        verticalSpacing(6),
                        AppText(
                          'Select rejection reason',
                          style: font16w500.copyWith(
                            color: const Color(0xFF9AA9BF),
                          ),
                        ),
                        verticalSpacing(12),
                        ...DeliverHomeDemoData.rejectReasons.map((
                          String reason,
                        ) {
                          final bool isSelected =
                              state.selectedRejectReason == reason;
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: DriverDeliveryRejectReasonTile(
                              title: reason,
                              isSelected: isSelected,
                              onTap: () {
                                context
                                    .read<DriverDeliveryDetailsCubit>()
                                    .selectRejectReason(reason);
                              },
                            ),
                          );
                        }),
                        verticalSpacing(10),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: AppButton(
                                text: 'Cancel',
                                onPressed: context.pop,
                                color: const Color(0xFFF2F5FB),
                                textColor: const Color(0xFF6D819F),
                                borderColor: const Color(0xFFD8E1EF),
                                radius: 18.r,
                                textSize: 15.sp,
                                textWeight: FontWeight.w700,
                                height: 58.h,
                              ),
                            ),
                            horizontalSpacing(12),
                            Expanded(
                              child: AppButton(
                                text: 'Confirm Rejection',
                                onPressed: state.selectedRejectReason == null
                                    ? null
                                    : () {
                                        context
                                            .read<DriverDeliveryDetailsCubit>()
                                            .confirmReject();
                                        context.pop();
                                      },
                                color: state.selectedRejectReason == null
                                    ? const Color(0xFFE7ECF7)
                                    : const Color(0xFFE34F5F),
                                textColor: state.selectedRejectReason == null
                                    ? const Color(0xFF9AA9BF)
                                    : Colors.white,
                                borderColor: state.selectedRejectReason == null
                                    ? const Color(0xFFDCE4F2)
                                    : const Color(0xFFE34F5F),
                                radius: 18.r,
                                textSize: 15.sp,
                                textWeight: FontWeight.w700,
                                height: 58.h,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
            ),
      ),
    );
  }
}