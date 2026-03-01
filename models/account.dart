abstract class Account {
  final String accountNumber;
  final String accountHolderName;
  double _balance;
  final double interestRate;

  Account(
    this.accountNumber,
    this.accountHolderName,
    this._balance,
    this.interestRate,
  );

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: $amount Tk into $accountHolderName's account");
    } else {
      print("Invalid deposit amount.");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrew: $amount Tk from $accountHolderName's account");
    } else {
      print("Invalid withdrawal amount or insufficient balance.");
    }
  }

  void calculateInterest() {
    double interest = _balance * interestRate;
    addInterest(interest);
  }

  double getBalance() {
    return _balance;
  }

  void deduct(double amount) {
    _balance -= amount;
  }

  void addInterest(double interest) {
    _balance += interest;
  }
}
