import '../models/account.dart';

class Bank {
  final List<Account> _accounts = [];

  void openAccount(Account account) {
    _accounts.add(account);
    print("Account opened for ${account.accountHolderName}");
  }

  Account? findAccount(String accountNumber) {
    for (var account in _accounts) {
      if (account.accountNumber == accountNumber) {
        return account;
      }
    }
    return null;
  }

  void transfer(
    String fromAccountNumber,
    String toAccountNumber,
    double amount,
  ) {
    Account? sender = findAccount(fromAccountNumber);
    Account? receiver = findAccount(toAccountNumber);

    if (sender != null &&
        receiver != null &&
        sender.getBalance() - amount >= 500) {
      sender.withdraw(amount);
      receiver.deposit(amount);
      print(
        "Transferred $amount Tk from ${sender.accountHolderName} to ${receiver.accountHolderName}",
      );
    } else {
      print("One or both accounts not found for transfer.");
    }
  }

  void showAllBalances() {
    print("All Account Balances:");
    for (var account in _accounts) {
      print("${account.accountHolderName}: ${account.getBalance()} Tk");
    }
  }
}
