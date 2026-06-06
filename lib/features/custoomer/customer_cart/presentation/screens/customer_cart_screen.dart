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
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_item_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_promo_code_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/remove_cart_item_dialog.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/clear_cart_dialog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
  bool _isPromoApplied = false;

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
            EasyLoading.show(status: state.isClearing ? 'Clearing cart...' : 'Removing...');
          } else {
            EasyLoading.dismiss();
            if (state.removeError != null) {
              EasyLoading.showError(state.removeError!);
            } else if (state.clearError != null) {
              EasyLoading.showError(state.clearError!);
            } else if (state.removeSuccess) {
              EasyLoading.showSuccess('Item removed');
            } else if (state.clearSuccess) {
              EasyLoading.showSuccess('Cart cleared');
            }
          }
        }
      },
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading || state is CartInitial) {
            return const Center(child: CupertinoActivityIndicator());
          }

          if (state is CartError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (state is CartLoaded) {
            final items = state.cart.items;
            final subtotal = state.cart.total.toDouble();
            final total = subtotal + (items.isEmpty ? 0 : _deliveryFee);

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
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 50.h),
                          child: const Text('Your cart is empty'),
                        ),
                      )
                    else ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cart Items (${items.length})',
                            style: font14w700.copyWith(
                              color: const Color(0xFF24385B),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => ClearCartDialog(
                                  cartCubit: context.read<CartCubit>(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.trash,
                                  size: 16.sp,
                                  color: Colors.redAccent,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  'Clear All',
                                  style: font12w700.copyWith(
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      ...List.generate(
                        items.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: CartItemCard(
                            item: items[index],
                            onIncrement: () {
                              context.read<CartCubit>().updateCartItem(
                                    items[index].id,
                                    items[index].quantity + 1,
                                  );
                            },
                            onDecrement: () {
                              if (items[index].quantity > 1) {
                                context.read<CartCubit>().updateCartItem(
                                      items[index].id,
                                      items[index].quantity - 1,
                                    );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => RemoveCartItemDialog(
                                    item: items[index],
                                    cartCubit: context.read<CartCubit>(),
                                  ),
                                );
                              }
                            },
                            onRemove: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => RemoveCartItemDialog(
                                  item: items[index],
                                  cartCubit: context.read<CartCubit>(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                    if (items.isNotEmpty) ...[
                      SizedBox(height: 8.h),
                      const Divider(height: 1, color: Color(0xFFD5DCE6)),
                      SizedBox(height: 22.h),
                      CartPromoCodeCard(
                        controller: _promoController,
                        isApplied: _isPromoApplied,
                        onApply: () {
                          if (_promoController.text.trim().isNotEmpty) {
                            setState(() {
                              _isPromoApplied = true;
                            });
                          }
                        },
                        onRemove: () {
                          setState(() {
                            _isPromoApplied = false;
                            _promoController.clear();
                          });
                        },
                      ),
                      SizedBox(height: 14.h),
                      CartBillSummaryCard(
                        subtotal: subtotal,
                        deliveryFee: _deliveryFee,
                        total: total,
                      ),
                      CartCheckoutBar(
                        total: total,
                        onCheckout: () {
                          final promo = _promoController.text.trim();
                          context.push(
                            Routes.checkoutScreen,
                            extra: (_isPromoApplied && promo.isNotEmpty) ? promo : null,
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