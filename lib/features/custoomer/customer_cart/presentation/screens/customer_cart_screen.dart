import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/di/services_locator.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/widgets/navbar_page_app_bar.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_state.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_bill_summary_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_checkout_bar.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_item_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_promo_code_card.dart';

class CustomerCartScreen extends StatelessWidget {
  const CustomerCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CartCubit>()..getCart(),
      child: const CustomerCartScreenBody(),
    );
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
    return BlocBuilder<CartCubit, CartState>(
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
                  else
                    ...List.generate(
                      items.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: CartItemCard(
                          item: items[index],
                          onIncrement: () {
                            // Call update item API here
                          },
                          onDecrement: () {
                            // Call update item API here
                          },
                          onRemove: () {
                            // Call remove item API here
                          },
                        ),
                      ),
                    ),
                  if (items.isNotEmpty) ...[
                    SizedBox(height: 8.h),
                    const Divider(height: 1, color: Color(0xFFD5DCE6)),
                    SizedBox(height: 22.h),
                    CartPromoCodeCard(controller: _promoController, onApply: () {}),
                    SizedBox(height: 14.h),
                    CartBillSummaryCard(
                      subtotal: subtotal,
                      deliveryFee: _deliveryFee,
                      total: total,
                    ),
                    CartCheckoutBar(
                      total: total,
                      onCheckout: () {
                        context.push(Routes.checkoutScreen);
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
    );
  }
}