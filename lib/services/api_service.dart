import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/crypto_model.dart';

class ApiService {
  static const String _baseUrl = 'https://api.coingecko.com/api/v3';

  Future<List<Crypto>> fetchTopCryptos() async {
    final response = await http.get(Uri.parse(
        '$_baseUrl/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=20&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => Crypto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
