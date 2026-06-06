import 'package:equatable/equatable.dart';

abstract class CustomerOrdersState extends Equatable {
  const CustomerOrdersState();
  
  @override
  List<Object?> get props => [];
}

class CustomerOrdersInitial extends CustomerOrdersState {}

class CustomerOrdersTabChanged extends CustomerOrdersState {
  final int selectedTabIndex;

  const CustomerOrdersTabChanged(this.selectedTabIndex);

  @override
  List<Object?> get props => [selectedTabIndex];
}
