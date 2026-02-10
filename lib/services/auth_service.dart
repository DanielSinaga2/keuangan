import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/api.dart';
import '../core/storage.dart';

class AuthService {
  static Future<bool> login(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('${Api.baseUrl}/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    print('STATUS CODE: ${response.statusCode}');
    print('BODY: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await Storage.saveToken(data['token']);
      return true;
    }

    return false;
  } catch (e) {
    print('LOGIN ERROR: $e');
    return false;
  }
}

}
