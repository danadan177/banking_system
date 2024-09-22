import 'package:banking_system/account_class.dart';
import 'package:banking_system/account_transaction_class.dart';
import 'package:banking_system/transaction_logger_mixin.dart';

class CurrentAccount extends Account with TransactionLoggerMixin {
  double overdraftLimit;
  double overdraftFee;
  bool overdraftProtection;

  CurrentAccount({
    required super.accountNumber,
    required super.balance,
    this.overdraftLimit = 1000,
    this.overdraftFee = 35.0,
    this.overdraftProtection = true,
  });

  @override
  void withdraw(double amount) {
    if (amount <= 0) {
      print("Withdrawal amount must be greater than zero.");
      return;
    }
    if (amount <= balance) {
      // Normal withdrawal when sufficient funds are available
      balance -= amount;
      logTransaction(
          AccountTransaction(transactionType: "withdrawal", amount: amount));
      print("Withdrawal of \$$amount successful. New balance: \$$balance");
    } else {
      // Overdraft handling
      double deficit = amount - balance;
      if (overdraftProtection && deficit <= overdraftLimit) {
        // Allow overdraft up to the limit
        balance -= amount;
        balance -= overdraftFee; // Apply overdraft fee
        logTransaction(
            AccountTransaction(transactionType: "withdrawal", amount: amount));
        print(
            "Withdrawal of \$$amount successful with overdraft. Overdraft fee of \$$overdraftFee applied. New balance: \$$balance");
      } else {
        print(
            "Overdraft limit exceeded. Withdrawal of \$$amount denied. Available balance: \$$balance, Overdraft limit: \$$overdraftLimit");
      }
    }
  }

  @override
  String toString() {
    return 'Current Account $accountNumber, Balance: \$$balance, Overdraft Protection: ${overdraftProtection ? "Enabled" : "Disabled"}, Overdraft Limit: \$$overdraftLimit';
  }
}
