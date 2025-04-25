import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      dotenv.env['URL_ENDPONIT'] ?? 'https://example.com/api/';
  final String username;
  final String password;

  ApiService({required this.username, required this.password});

  Future<http.Response> getStudentData(String ci) async {
    final String url = '$baseUrl$ci';
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{'Authorization': basicAuth},
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load student data');
    }
  }
}
