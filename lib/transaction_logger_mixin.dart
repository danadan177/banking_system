import 'package:banking_system/account_transaction_class.dart';

mixin TransactionLoggerMixin {
  List<AccountTransaction> transactionLog = [];

  void logTransaction(AccountTransaction transaction) {
    transactionLog.add(transaction);
    print("Transaction logged: ${transaction.transactionType}");
  }

  void printTransactionLog() {
    if (transactionLog.isEmpty) {
      print("No transactions to display.");
    } else {
      for (var transaction in transactionLog) {
        print("Transaction logged: ${transaction.transactionType}");
      }
    }
  }
}
