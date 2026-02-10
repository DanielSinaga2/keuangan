import 'package:flutter/material.dart';
import '../data/dummy_transactions.dart';
import '../models/transaction_model.dart';
import '../widgets/transaction_card.dart';
import 'add_transaction_page.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double get totalBalance {
    double total = 0;
    for (var t in dummyTransactions) {
      total += t.type == TransactionType.income ? t.amount : -t.amount;
    }
    return total;
  }

  void addTransaction(FinanceTransaction transaction) {
    setState(() {
      dummyTransactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Finance App')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTransactionPage()),
          );

          if (result != null && result is FinanceTransaction) {
            addTransaction(result);
          }
        },
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Saldo Total',
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  'Rp ${totalBalance.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dummyTransactions.length,
              itemBuilder: (context, index) {
                final transaction = dummyTransactions[index];
                return TransactionCard(
                  transaction: transaction,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AddTransactionPage()),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
