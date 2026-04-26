import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/widgets/navbar_page_app_bar.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_bill_summary_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_checkout_bar.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_item_card.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_item_model.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/cart_promo_code_card.dart';

class CustomerCartScreen extends StatefulWidget {
  const CustomerCartScreen({super.key});

  @override
  State<CustomerCartScreen> createState() => _CustomerCartScreenState();
}

class _CustomerCartScreenState extends State<CustomerCartScreen> {
  static const double _deliveryFee = 2.99;

  final TextEditingController _promoController = TextEditingController();

  final List<CartItemModel> _items = <CartItemModel>[
    const CartItemModel(
      name: 'Aquafina Water 12-Pack',
      price: 8.99,
      icon: Icons.water_drop,
      imagePath: Assets.newLogo,
      quantity: 2,
    ),
    const CartItemModel(
      name: '5-Gallon Jug',
      price: 12.99,
      icon: Icons.local_drink,
      imagePath: Assets.logo,
      quantity: 1,
    ),
  ];

  double get _subtotal =>
      _items.fold<double>(0, (sum, item) => sum + (item.price * item.quantity));

  double get _total => _subtotal + (_items.isEmpty ? 0 : _deliveryFee);

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  void _incrementItem(int index) {
    setState(() {
      final CartItemModel current = _items[index];
      _items[index] = current.copyWith(quantity: current.quantity + 1);
    });
  }

  void _decrementItem(int index) {
    setState(() {
      final CartItemModel current = _items[index];
      if (current.quantity > 1) {
        _items[index] = current.copyWith(quantity: current.quantity - 1);
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            ...List.generate(
              _items.length,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: CartItemCard(
                  item: _items[index],
                  onIncrement: () => _incrementItem(index),
                  onDecrement: () => _decrementItem(index),
                  onRemove: () => _removeItem(index),
                ),
              ),
            ),
            if (_items.isNotEmpty) ...[
              SizedBox(height: 8.h),
              const Divider(height: 1, color: Color(0xFFD5DCE6)),
              SizedBox(height: 22.h),
            ],
            CartPromoCodeCard(controller: _promoController, onApply: () {}),
            SizedBox(height: 14.h),
            CartBillSummaryCard(
              subtotal: _subtotal,
              deliveryFee: _items.isEmpty ? 0 : _deliveryFee,
              total: _total,
            ),
            CartCheckoutBar(
              total: _total,
              onCheckout: () {
                context.push(Routes.checkoutScreen);
              },
            ),
            SizedBox(height: 104.h),
          ],
        ),
      ),
    );
  }
}
