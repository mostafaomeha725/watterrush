import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/utils/easy_loading.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_cubit.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/cubit/home_cubit/customer_home_state.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_body_content.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_route_categories_mapper.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_view_models.dart';
import 'package:waterrush/core/di/services_locator.dart';

class CustomerHomeScreenBody extends StatelessWidget {
  const CustomerHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CustomerHomeCubit>(),
      child: const _CustomerHomeContent(),
    );
  }
}

class _CustomerHomeContent extends StatefulWidget {
  const _CustomerHomeContent();

  @override
  State<_CustomerHomeContent> createState() => _CustomerHomeContentState();
}

class _CustomerHomeContentState extends State<_CustomerHomeContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CustomerHomeCubit>().initHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerHomeCubit, CustomerHomeState>(
      listener: (context, state) {
        if (state.status == CustomerHomeStatus.success &&
            state.message.isNotEmpty) {
          showSuccess(state.message);
          context.read<CustomerHomeCubit>().clearStatus();
        }
      },
      builder: (context, state) {
        final CustomerHomeCubit cubit = context.read<CustomerHomeCubit>();

        List<CategoryItemData> routeCategories = [];
        List<HomeCategoryViewModel> displayCategories = [];

        if (state.categories.isNotEmpty) {
          routeCategories = mapApiCategoriesToRouteCategories(state.categories);
          displayCategories = mapApiCategoriesToHomeCategories(
            state.categories,
          );
        }
        return SafeArea(
          child: CustomerHomeBodyContent(
            cubit: cubit,
            routeCategories: routeCategories,
            displayCategories: displayCategories,
          ),
        );
      },
    );
  }
}
