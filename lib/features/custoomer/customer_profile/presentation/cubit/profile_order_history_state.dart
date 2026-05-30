import 'package:equatable/equatable.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_models.dart';

class ProfileOrderHistoryState extends Equatable {
  const ProfileOrderHistoryState({
    required this.filteredOrders,
    this.isExpanded = false,
    this.selectedDate,
  });

  final bool isExpanded;
  final DateTime? selectedDate;
  final List<ProfileOrderModel> filteredOrders;

  ProfileOrderHistoryState copyWith({
    bool? isExpanded,
    DateTime? selectedDate,
    List<ProfileOrderModel>? filteredOrders,
    bool clearSelectedDate = false,
  }) {
    return ProfileOrderHistoryState(
      isExpanded: isExpanded ?? this.isExpanded,
      selectedDate: clearSelectedDate
          ? null
          : (selectedDate ?? this.selectedDate),
      filteredOrders: filteredOrders ?? this.filteredOrders,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    isExpanded,
    selectedDate,
    filteredOrders,
  ];
}