part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeEventAdd extends HomeEvent {}

class HomeEventCaseOut extends HomeEvent {
  final double money;
  HomeEventCaseOut(
    this.money,
  );
}

class HomeAccountName extends HomeEvent {
  String name;
  String bankName;
  HomeAccountName({required this.name, required this.bankName});
}
