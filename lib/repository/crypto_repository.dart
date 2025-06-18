import '../models/crypto_model.dart';
import '../services/api_service.dart';

class CryptoRepository {
  final ApiService apiService;

  CryptoRepository({required this.apiService});

  Future<List<Crypto>> getTopCryptos() async {
    try {
      return await apiService.fetchTopCryptos();
    } catch (e) {
      throw Exception('Error fetching cryptos: $e');
    }
  }
}
