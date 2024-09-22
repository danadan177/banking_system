import 'package:banking_system/account_class.dart';
import 'package:banking_system/taxable_interface.dart';

class SavingsAccount extends Account implements TaxableInterface {
  double profitSharingRatio;
  double investmentProfit = 0;
  final double taxRate = 0.05;

  SavingsAccount({
    required super.accountNumber,
    required super.balance,
    required this.profitSharingRatio,
  });

  void applyProfit() {
    double accountHolderShare = investmentProfit * profitSharingRatio;
    balance += accountHolderShare;
    print(
        "Profit of \$$accountHolderShare applied to account. New balance: \$$balance");
    investmentProfit = 0;
  }

  void calculateProfit(double totalProfit) {
    investmentProfit = totalProfit;
    double accountHolderShare = totalProfit * profitSharingRatio;
    print(
        "Calculated investment profit: \$$totalProfit. Account holder's share: \$$accountHolderShare");
  }

  @override
  void applyTax() {
    if (investmentProfit > 0) {
      double taxAmount = investmentProfit * taxRate;
      investmentProfit -= taxAmount;
      print("Tax of \$$taxAmount applied to investment profit.");
    } else {
      print("No investment profit available to apply tax.");
    }
  }
}
