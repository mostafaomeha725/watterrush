import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/widgets/app_asset.dart';
import 'package:waterrush/core/widgets/custom_text.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_item_model.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_quantity_button.dart';
import 'package:flutter/cupertino.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  final CartItemModel item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFDDE3EC)),
      ),
      child: Row(
        children: [
          // ICON BOX
          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              color: const Color(0xFFDFF3FA),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: AppAsset(assetName: Assets.test, fit: BoxFit.cover),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: font14w500.copyWith(color: const Color(0xFF0F2B46)),
                ),

                SizedBox(height: 4.h),

                AppText(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: font14w700.copyWith(color: const Color(0xFF0598D6)),
                ),

                SizedBox(height: 10.h),

                Row(
                  children: [
                    CartQuantityButton(
                      icon: Icons.remove,
                      isPrimary: false,
                      onTap: onDecrement,
                    ),
                    SizedBox(width: 12.w),
                    AppText(
                      '${item.quantity}',
                      style: font12w400.copyWith(
                        color: const Color(0xFF0F2B46),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    CartQuantityButton(
                      icon: Icons.add,
                      isPrimary: true,
                      onTap: onIncrement,
                    ),
                  ],
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: onRemove,
            child: Padding(
              padding: EdgeInsets.only(left: 6.w),
              child: Icon(
                CupertinoIcons.delete,
                color: const Color(0xFFFF3B30),
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
