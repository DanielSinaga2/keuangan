import 'dart:convert';
import 'package:finance_app/models/transaction_model.dart';
import 'package:http/http.dart' as http;
import '../core/api.dart';
import '../core/storage.dart';

class ApiService {
  static Future<List<dynamic>> getTransactions() async {
    final token = await Storage.getToken();

    final response = await http.get(
      Uri.parse('${Api.baseUrl}/transactions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

  static Future<void> createTransaction(FinanceTransaction t) async {}

  static Future<void> updateTransaction(int i, FinanceTransaction t) async {}
}
