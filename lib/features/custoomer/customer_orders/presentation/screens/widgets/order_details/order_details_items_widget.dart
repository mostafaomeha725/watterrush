import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/core/widgets/app_image.dart';

import 'package:waterrush/features/custoomer/customer_orders/domain/entities/customer_order_entity.dart';

class OrderDetailsItemsWidget extends StatefulWidget {
  final CustomerOrderEntity order;

  const OrderDetailsItemsWidget({super.key, required this.order});

  @override
  State<OrderDetailsItemsWidget> createState() =>
      _OrderDetailsItemsWidgetState();
}

class _OrderDetailsItemsWidgetState extends State<OrderDetailsItemsWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Order Items (${widget.order.items?.length ?? 0})',
            style: font16w700.copyWith(color: const Color(0xFF0F2B46)),
          ),
          SizedBox(height: 16.h),
          if (widget.order.items == null || widget.order.items!.isEmpty)
            Center(
              child: AppText(
                'No items found',
                style: font12w500.copyWith(color: const Color(0xFF8B92A2)),
              ),
            )
          else ...[
            ...widget.order.items!
                .take(isExpanded ? widget.order.items!.length : 1)
                .map((item) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60.w,
                            height: 60.w,
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F8FB),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: AppImage(imageUrl: item.image),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  item.title,
                                  style: font14w700.copyWith(
                                    color: const Color(0xFF1B2028),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                AppText(
                                  'Qty: ${item.quantity} • EGP ${item.unitPrice.toStringAsFixed(2)} each',
                                  style: font12w500.copyWith(
                                    color: const Color(0xFF8B92A2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppText(
                            'EGP ${item.subtotal.toStringAsFixed(2)}',
                            style: font14w700.copyWith(
                              color: const Color(0xFF1B2028),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                    ],
                  );
                })
                .toList(),
            if (isExpanded && widget.order.items!.length > 1) ...[
              Divider(color: const Color(0xFFF3F4F6)),
              SizedBox(height: 12.h),
              Center(
                child: AppText(
                  'No other items',
                  style: font12w500.copyWith(color: const Color(0xFF8B92A2)),
                ),
              ),
            ],
          ],
          SizedBox(height: 16.h),
          Divider(color: const Color(0xFFF3F4F6)),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  isExpanded ? 'Hide Items' : 'View All Items',
                  style: font12w700.copyWith(color: const Color(0xFF0B48C6)),
                ),
                SizedBox(width: 4.w),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: const Color(0xFF0B48C6),
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
