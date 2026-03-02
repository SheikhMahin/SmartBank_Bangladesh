import 'account.dart';

const double defaultInterestRate = 0.10;

class FixedDepositAccount extends Account {
  final DateTime openingDate;
  final Duration maturityPeriod = Duration(days: 365);

  FixedDepositAccount(
    String accountNumber,
    String accountHolderName,
    double balance, {
    DateTime? customOpeningDate,
  }) : openingDate = customOpeningDate ?? DateTime.now(),
       super(accountNumber, accountHolderName, balance, defaultInterestRate);

  bool isMatured() {
    return DateTime.now().difference(openingDate) >= maturityPeriod;
  }

  @override
  void withdraw(double amount) {
    if (isMatured() &&
        amount > 0 &&
        amount <= getBalance() &&
        getBalance() >= 500) {
      print(
        "Withdrawing: $amount Tk from ${accountHolderName}'s fixed deposit account",
      );
    } else {
      print(
        "Invalid withdrawal amount, insufficient balance, or account not matured.",
      );
    }
  }

  @override
  void calculateInterest() {
    double interest = getBalance() * (interestRate);
    addInterest(interest);
    print(
      "Interest of $interest Tk added to ${accountHolderName}'s fixed deposit account",
    );
  }
}
