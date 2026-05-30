import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_snack_bar.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/customer_home_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/customer_home_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_body_content.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_mock_data.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_route_categories_mapper.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/core/di/services_locator.dart';

class CustomerHomeScreenBody extends StatelessWidget {
  const CustomerHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryItemData> routeCategories = mapToRouteCategories(
      customerHomeCategories,
    );

    return BlocProvider(
      create: (_) => sl<CustomerHomeCubit>(),
      child: BlocConsumer<CustomerHomeCubit, CustomerHomeState>(
        listener: (context, state) {
          if (state.status == CustomerHomeStatus.success &&
              state.message.isNotEmpty) {
            CustomSnackBar.showSuccess(context, message: state.message);
            context.read<CustomerHomeCubit>().clearStatus();
          }
        },
        builder: (context, state) {
          final CustomerHomeCubit cubit = context.read<CustomerHomeCubit>();
          return Stack(
            children: [
              SafeArea(
                child: CustomerHomeBodyContent(
                  cubit: cubit,
                  routeCategories: routeCategories,
                ),
              ),
              if (state.status == CustomerHomeStatus.loading)
                Positioned.fill(child: CustomLoading.showLoader()),
            ],
          );
        },
      ),
    );
  }
}
