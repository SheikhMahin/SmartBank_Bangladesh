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
}
