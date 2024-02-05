part of 'home_bloc.dart';

class HomeState extends Equatable {
  final double amount;
  final String accountName;
  final double money;
  final String bankName;
  const HomeState(
      {this.amount = 99999.99,
      this.money = 0.0,
      this.accountName = "",
      this.bankName = ""});

  HomeState coppyWith(
      {double? amount, String? accountName, double? money, String? bankName}) {
    return HomeState(
        amount: amount ?? this.amount,
        accountName: accountName ?? this.accountName,
        money: money ?? this.money,
        bankName: bankName ?? this.bankName);
  }

  @override
  List<Object?> get props => [amount, accountName, money, bankName];
}
