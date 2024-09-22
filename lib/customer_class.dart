import 'package:banking_system/account_class.dart';

class Customer {
  String name;
  int age;
  List<Account> accounts = [];

  Customer({required this.name, required this.age});

  void addAccount(Account account) {
    accounts.add(account);
  }

  double getTotalBalance() {
    double totalBalance = 0;
    for (var account in accounts) {
      totalBalance += account.balance;
    }
    return totalBalance;
  }

  String getDetails() {
    return 'Customer Name: $name, Age: $age, Total Balance: ${getTotalBalance()}';
  }
}
