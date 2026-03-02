import 'account.dart';

class SavingsAccount extends Account {
  SavingsAccount(
    String accountNumber,
    String accountHolderName,
    double balance,
    double interestRate,
  ) : super(accountNumber, accountHolderName, balance, 0.05);

  @override
  void withdraw(double amount) {
    if (amount > 0 && amount <= getBalance() && getBalance() >= 500) {
      print(
        "Withdrawing: $amount Tk from ${accountHolderName}'s savings account",
      );
      super.withdraw(amount);
    } else {
      print(
        "Invalid withdrawal amount, insufficient balance, or minimum balance requirement not met.",
      );
    }
  }

  @override
  void calculateInterest() {
    double interest = getBalance() * (interestRate);
    addInterest(interest);
    print(
      "Interest of $interest Tk added to ${accountHolderName}'s savings account",
    );
  }
}
