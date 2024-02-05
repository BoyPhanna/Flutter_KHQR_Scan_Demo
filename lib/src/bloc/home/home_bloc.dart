import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeEventAdd>((event, emit) {
      emit(state.coppyWith(amount: state.amount - 2));
    });
    on<HomeEventCaseOut>(
      (event, emit) {
        emit(state.coppyWith(
            amount: state.amount - event.money, money: event.money));
      },
    );
    on<HomeAccountName>(
      (event, emit) {
        emit(
            state.coppyWith(accountName: event.name, bankName: event.bankName));
      },
    );
  }
}
