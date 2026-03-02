import 'account.dart';

class FixedDepositAccount extends Account {
  final DateTime openingDate;
  final Duration maturityPeriod = Duration(days: 365);

  FixedDepositAccount(
    String accountNumber,
    String accountHolderName,
    double balance,
    double interestRate,
  ) : openingDate = DateTime.now(),
      super(accountNumber, accountHolderName, balance, 0.10);

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
