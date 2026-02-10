enum TransactionType { income, expense }

class FinanceTransaction {
  final String title;
  final double amount;
  final TransactionType type;
  final DateTime date;

  FinanceTransaction({
    required this.title,
    required this.amount,
    required this.type,
    required this.date,
  });
}
