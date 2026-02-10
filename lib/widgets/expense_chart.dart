import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class ExpenseChart extends StatelessWidget {
  final List<FinanceTransaction> transactions;

  const ExpenseChart({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    final expenseTransactions = transactions
        .where((t) => t.type == TransactionType.expense)
        .toList();

    if (expenseTransactions.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Belum ada data pengeluaran'),
      );
    }

    final totalExpense = expenseTransactions.fold<double>(
      0,
      (sum, item) => sum + item.amount,
    );

    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: expenseTransactions.map((t) {
            final percentage = (t.amount / totalExpense) * 100;

            return PieChartSectionData(
              value: t.amount,
              title: '${percentage.toStringAsFixed(1)}%',
              radius: 70,
              titleStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
