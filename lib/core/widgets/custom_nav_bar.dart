import 'package:waterrush/core/widgets/custom_bottom_navbar.dart';
import 'package:waterrush/core/widgets/customer_nav_data.dart';
import 'package:waterrush/core/widgets/deliver_nav_data.dart';
import 'package:waterrush/core/widgets/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/utils/easy_loading.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_cubit.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/cubit/cart_state.dart';

class CustomNavBar extends StatefulWidget {
  final bool isCustomer;

  const CustomNavBar({super.key, this.isCustomer = false});

  // ignore: library_private_types_in_public_api
  static _CustomNavBarState? of(BuildContext context) =>
      context.findAncestorStateOfType<_CustomNavBarState>();

  static void switchToTab(BuildContext context, int index) {
    final _CustomNavBarState? state = of(context);
    state?._switchToTab(index);
  }

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  late NavigationState _navState;
  late List<Map<String, dynamic>> _navItems;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _navState = NavigationState();
    _initializeNavigation();
  }

  void _initializeNavigation() {
    if (widget.isCustomer) {
      _navItems = CustomerNavData.items;
      _screens = CustomerNavData.screens;
    } else {
      _navItems = DeliverNavData.items;
      _screens = DeliverNavData.screens;
    }
  }

  void goBack() {
    setState(() {
      if (_navState.navigationStack.length > 1) {
        _navState.navigationStack.removeLast();
        _navState.selectedIndex = _navState.navigationStack.last;
      }
    });
  }

  void _switchToTab(int index) {
    if (index < 0 || index >= _screens.length) return;

    setState(() {
      _navState.selectedIndex = index;
      _navState.navigationStack.add(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _navState.navigationStack.length <= 1,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _navState.handleBackPress(() => setState(() {}));
      },
      child: BlocListener<CartCubit, CartState>(
        listenWhen: (previous, current) {
          if (previous is CartLoaded && current is CartLoaded) {
            return previous.isAddingToCart != current.isAddingToCart ||
                previous.addToCartSuccess != current.addToCartSuccess ||
                previous.addToCartError != current.addToCartError;
          }
          return false;
        },
        listener: (context, state) {
          if (state is CartLoaded) {
            if (state.isAddingToCart) {
              showLoading();
            } else if (state.addToCartSuccess) {
              hideLoading();
              showSuccess('Item added successfully');
            } else if (state.addToCartError != null) {
              hideLoading();
              showError(state.addToCartError!);
            }
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xfff8f9fa),
          extendBody: true,
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _screens[_navState.selectedIndex],
          ),
          bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
            buildWhen: (previous, current) {
              if (previous is CartLoaded && current is CartLoaded) {
                return previous.cart != current.cart;
              }
              return previous.runtimeType != current.runtimeType;
            },
            builder: (context, cartState) {
              int cartCount = 0;
              if (cartState is CartLoaded) {
                cartCount = cartState.cart.items.fold(
                  0,
                  (sum, item) => sum + item.quantity,
                );
              }

              final List<Map<String, dynamic>> dynamicNavItems =
                  _navItems.map((item) {
                if (item['label'] == 'Cart') {
                  return <String, dynamic>{...item, 'badgeCount': cartCount};
                }
                return item;
              }).toList();

              return CustomBottomNavBar(
                navItems: dynamicNavItems,
                navState: _navState,
                onItemTapped: (index) {
                  _navState.onItemTapped(index, () => setState(() {}));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
