import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_header_section.dart';
import 'package:waterrush/features/driver/deliver_home/presentation/screens/widgets/deliver_home_orders_content_section.dart';

class DeliverHomeScreenBody extends StatelessWidget {
  const DeliverHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double headerReservedSpace =
        MediaQuery.paddingOf(context).top + 176.h;

    return Container(
      color: const Color(0xFFEEF1F9),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: headerReservedSpace + 8.h),
                child: const DeliverHomeOrdersContentSection(),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: const DeliverHomeHeaderSection(),
          ),
        ],
      ),
    );
  }
}
