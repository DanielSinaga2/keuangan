import '../models/transaction_model.dart';

List<FinanceTransaction> dummyTransactions = [
  FinanceTransaction(
    title: 'Gaji Bulanan',
    amount: 5000000,
    type: TransactionType.income,
    date: DateTime.now(),
  ),
  FinanceTransaction(
    title: 'Beli Makan',
    amount: 50000,
    type: TransactionType.expense,
    date: DateTime.now(),
  ),
];
