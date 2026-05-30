import 'package:waterrush/core/widgets/nav_bar_item.dart';
import 'package:waterrush/core/widgets/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  final List<Map<String, dynamic>> navItems;
  final NavigationState navState;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.navItems,
    required this.navState,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(18.w, 0, 18.w, 14.h),
        height: 74.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: const Color(0xFFE4ECF7)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFBCCEE5).withValues(alpha: 0.22),
              blurRadius: 22.r,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            const int referenceSlots = 5;
            final double slotWidth = constraints.maxWidth / referenceSlots;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(navItems.length, (index) {
                return SizedBox(
                  width: slotWidth,
                  child: NavBarItem(
                    assetPath: navItems[index]['assetPath'],
                    label: navItems[index]['label'],
                    badgeCount: navItems[index]['badgeCount'] ?? 0,
                    isSelected: navState.selectedIndex == index,
                    onTap: () {
                      onItemTapped(index);
                    },
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}