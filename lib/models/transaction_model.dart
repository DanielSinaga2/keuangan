enum TransactionType { income, expense }

class FinanceTransaction {
  final int? id;
  final String title;
  final double amount;
  final TransactionType type;
  final DateTime date;

  FinanceTransaction({
    this.id,
    required this.title,
    required this.amount,
    required this.type,
    required this.date,
  });

  factory FinanceTransaction.fromJson(Map<String, dynamic> json) {
    return FinanceTransaction(
      id: json['id'],
      title: json['title'],
      amount: double.parse(json['amount'].toString()),
      type: json['type'] == 'income'
          ? TransactionType.income
          : TransactionType.expense,
      date: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "amount": amount,
      "type": type == TransactionType.income ? "income" : "expense",
    };
  }
}
