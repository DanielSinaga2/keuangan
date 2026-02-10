import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class DetailPage extends StatelessWidget {
  final FinanceTransaction transaction;

  DetailPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.income;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Transaksi')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              isIncome ? 'Pemasukan' : 'Pengeluaran',
              style: TextStyle(color: isIncome ? Colors.green : Colors.red),
            ),
            const SizedBox(height: 10),
            Text('Rp ${transaction.amount.toStringAsFixed(0)}'),
            const SizedBox(height: 10),
            Text(transaction.date.toLocal().toString()),
          ],
        ),
      ),
    );
  }
}
