import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../services/api_service.dart';

class AddTransactionPage extends StatefulWidget {
  final FinanceTransaction? transaction;

  const AddTransactionPage({super.key, this.transaction});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  late TextEditingController titleController;
  late TextEditingController amountController;
  late TransactionType type;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    titleController =
        TextEditingController(text: widget.transaction?.title ?? '');
    amountController = TextEditingController(
        text: widget.transaction?.amount.toString() ?? '');
    type = widget.transaction?.type ?? TransactionType.income;
  }

  Future<void> save() async {
    setState(() => isLoading = true);

    final t = FinanceTransaction(
      title: titleController.text,
      amount: double.parse(amountController.text),
      type: type,
      date: DateTime.now(),
    );

    if (widget.transaction == null) {
      await ApiService.createTransaction(t);
    } else {
      await ApiService.updateTransaction(widget.transaction!.id!, t);
    }

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.transaction == null
            ? 'Tambah Transaksi'
            : 'Edit Transaksi'),
      ),
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
            DropdownButton<TransactionType>(
              value: type,
              items: const [
                DropdownMenuItem(
                    value: TransactionType.income,
                    child: Text('Pemasukan')),
                DropdownMenuItem(
                    value: TransactionType.expense,
                    child: Text('Pengeluaran')),
              ],
              onChanged: (v) => setState(() => type = v!),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: save,
                    child: const Text('Simpan'),
                  ),
          ],
        ),
      ),
    );
  }
}
