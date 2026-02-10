import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class TransactionCard extends StatelessWidget {
  final FinanceTransaction transaction;
  final VoidCallback onTap;

  const TransactionCard({
    super.key,
    required this.transaction,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.income;

    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          isIncome ? Icons.arrow_downward : Icons.arrow_upward,
          color: isIncome ? Colors.green : Colors.red,
        ),
        title: Text(transaction.title),
        subtitle: Text(transaction.date.toLocal().toString().split(' ')[0]),
        trailing: Text(
          '${isIncome ? '+' : '-'} Rp ${transaction.amount.toStringAsFixed(0)}',
          style: TextStyle(
            color: isIncome ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
