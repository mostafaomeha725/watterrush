import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/cubit/profile_order_history_state.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_models.dart';

class ProfileOrderHistoryCubit extends Cubit<ProfileOrderHistoryState> {
  ProfileOrderHistoryCubit({required List<ProfileOrderModel> orders})
    : _orders = List<ProfileOrderModel>.unmodifiable(orders),
      super(
        ProfileOrderHistoryState(
          filteredOrders: List<ProfileOrderModel>.unmodifiable(orders),
        ),
      );

  final List<ProfileOrderModel> _orders;

  void toggleExpanded() {
    emit(state.copyWith(isExpanded: !state.isExpanded));
  }

  Future<void> selectDateFilter(BuildContext context) async {
    if (_orders.isEmpty) {
      return;
    }

    DateTime minDate = _orders.first.orderedAt;
    DateTime maxDate = _orders.first.orderedAt;

    for (final ProfileOrderModel order in _orders) {
      if (order.orderedAt.isBefore(minDate)) {
        minDate = order.orderedAt;
      }
      if (order.orderedAt.isAfter(maxDate)) {
        maxDate = order.orderedAt;
      }
    }

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: state.selectedDate ?? maxDate,
      firstDate: minDate,
      lastDate: maxDate,
    );

    if (pickedDate == null) {
      return;
    }

    final List<ProfileOrderModel> filtered = _orders.where((
      ProfileOrderModel order,
    ) {
      return order.orderedAt.year == pickedDate.year &&
          order.orderedAt.month == pickedDate.month &&
          order.orderedAt.day == pickedDate.day;
    }).toList();

    emit(
      state.copyWith(
        selectedDate: DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
        ),
        filteredOrders: filtered,
      ),
    );
  }

  void clearDateFilter() {
    emit(
      state.copyWith(
        clearSelectedDate: true,
        filteredOrders: List<ProfileOrderModel>.unmodifiable(_orders),
      ),
    );
  }
}
