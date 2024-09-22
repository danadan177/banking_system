import 'package:banking_system/account_transaction_class.dart';
import 'package:banking_system/transaction_logger_mixin.dart';

class Account with TransactionLoggerMixin {
  String accountNumber;
  double balance;
  List<AccountTransaction> transactions = [];

  Account({required this.accountNumber, required this.balance});

  void deposit(double amount) {
    if (amount <= 0) {
      print("Deposit amount must be greater than zero.");
      return;
    }
    balance += amount;
    logTransaction(
        AccountTransaction(transactionType: "deposit", amount: amount));
    print("Deposit of \$$amount successful. New balance: \$$balance");
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print("Withdrawal amount must be greater than zero.");
      return;
    }
    if (amount > balance) {
      print(
          "Insufficient funds. Cannot withdraw \$$amount. Available balance: \$$balance");
      return;
    }
    balance -= amount;
    logTransaction(
        AccountTransaction(transactionType: "withdrawal", amount: amount));
    print("Withdrawal of \$$amount successful. New balance: \$$balance");
  }
}
