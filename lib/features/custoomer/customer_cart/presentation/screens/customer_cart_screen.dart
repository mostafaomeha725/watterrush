import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/widgets/navbar_page_app_bar.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_state.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_bill_summary_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_checkout_bar.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_promo_code_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/empty_cart_widget.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_items_list_widget.dart';
import 'package:waterrush/core/utils/easy_loading.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class CustomerCartScreen extends StatelessWidget {
  const CustomerCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomerCartScreenBody();
  }
}

class CustomerCartScreenBody extends StatefulWidget {
  const CustomerCartScreenBody({super.key});

  @override
  State<CustomerCartScreenBody> createState() => _CustomerCartScreenBodyState();
}

class _CustomerCartScreenBodyState extends State<CustomerCartScreenBody> {
  static const double _deliveryFee = 2.99;

  final TextEditingController _promoController = TextEditingController();

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartLoaded) {
          if (state.isRemoving || state.isClearing) {
            showLoading(
              status: state.isClearing ? 'Clearing cart...' : 'Removing...',
            );
          } else {
            hideLoading();
            if (state.removeError != null) {
              showError(state.removeError!);
            } else if (state.clearError != null) {
              showError(state.clearError!);
            } else if (state.promoCodeError != null) {
              showError(state.promoCodeError!);
            } else if (state.removeSuccess) {
              showSuccess('Item removed');
            } else if (state.clearSuccess) {
              showSuccess('Cart cleared');
            } else if (state.promoCode != null && state.discountPercentage > 0) {
              // We might not want to show a toast every time state rebuilds,
              // but for now, we leave it or rely on the UI changes.
            }
          }
        }
      },
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading || state is CartInitial) {
            return Center(child: CustomLoading.showLoader());
          }

          if (state is CartError) {
            return Center(
              child: AppText(
                state.message,
                color: Colors.red,
                fontSize: 14.sp,
              ),
            );
          }

          if (state is CartLoaded) {
            final items = state.cart.items;
            final subtotal = state.cart.total.toDouble();
            
            final isPercent = state.discountType == 'percent' || state.discountType == 'percentage';
            final discount = isPercent 
                ? subtotal * (state.discountPercentage / 100) 
                : state.discountPercentage;
                
            final delivery = items.isEmpty ? 0.0 : _deliveryFee;
            final total = (subtotal - discount + delivery).clamp(0.0, double.infinity);

            // Sync controller if state has promo code
            if (state.promoCode != null && _promoController.text != state.promoCode) {
              _promoController.text = state.promoCode!;
            } else if (state.promoCode == null && _promoController.text.isNotEmpty) {
              // Wait, clearing the controller if promo code is null might be annoying
              // if they just typed it and got an error. Let's only do it if they click remove.
              // Actually, removePromoCode() clears the state, and we can clear the controller there.
            }

            final isApplied = state.promoCode != null && state.discountPercentage > 0;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 32.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NavBarPageAppBar(
                      title: 'My Cart',
                      subtitle: 'Review items and proceed to checkout',
                      leadingIcon: Icons.shopping_bag_rounded,
                    ),
                    SizedBox(height: 10.h),
                    if (items.isEmpty)
                      const EmptyCartWidget()
                    else
                      CartItemsListWidget(items: items),

                    if (items.isNotEmpty) ...[
                      SizedBox(height: 8.h),
                      const Divider(height: 1, color: Color(0xFFD5DCE6)),
                      SizedBox(height: 22.h),
                      CartPromoCodeCard(
                        controller: _promoController,
                        isApplied: isApplied,
                        onApply: () {
                          if (_promoController.text.trim().isNotEmpty) {
                            showLoading(status: 'Applying...');
                            context.read<CartCubit>().applyPromoCode(
                                  _promoController.text.trim(),
                                );
                          }
                        },
                        onRemove: () {
                          _promoController.clear();
                          context.read<CartCubit>().removePromoCode();
                        },
                      ),
                      SizedBox(height: 14.h),
                      CartBillSummaryCard(
                        subtotal: subtotal,
                        deliveryFee: delivery,
                        discount: discount,
                        total: total,
                      ),
                      CartCheckoutBar(
                        total: total,
                        onCheckout: () {
                          final promo = _promoController.text.trim();
                          context.push(
                            Routes.checkoutScreen,
                            extra: (isApplied && promo.isNotEmpty)
                                ? promo
                                : null,
                          );
                        },
                      ),
                    ],
                    SizedBox(height: 104.h),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
