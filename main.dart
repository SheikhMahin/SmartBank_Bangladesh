import 'models/savings_account.dart';
import 'models/fixed_deposit_account.dart';
import 'bank/bank.dart';

void main() {
  Bank smartBank = Bank();

  SavingsAccount rahim = SavingsAccount("S001", "Rahim Uddin", 100000);

  smartBank.openAccount(rahim);
  FixedDepositAccount karim = FixedDepositAccount(
    "F001",
    "Karim Uddin",
    500000,
  );

  smartBank.openAccount(karim);
  smartBank.showAllBalances();
}
