import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  TransactionType type = TransactionType.income;

  void save() {
    if (titleController.text.isEmpty || amountController.text.isEmpty) return;

    Navigator.pop(
      context,
      FinanceTransaction(
        title: titleController.text,
        amount: double.parse(amountController.text),
        type: type,
        date: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Transaksi')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Jumlah'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            DropdownButton<TransactionType>(
              value: type,
              items: const [
                DropdownMenuItem(
                  value: TransactionType.income,
                  child: Text('Pemasukan'),
                ),
                DropdownMenuItem(
                  value: TransactionType.expense,
                  child: Text('Pengeluaran'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  type = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: save, child: const Text('Simpan')),
          ],
        ),
      ),
    );
  }
}
