import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiRepository {
  final GenerativeModel _model;

  GeminiRepository(String apiKey)
      : _model = GenerativeModel(model: 'gemini-1.5-pro', apiKey: apiKey);

  Future<String> askGemini(String question) async {
    try {
      final content = [Content.text(question)];
      final response = await _model.generateContent(content);
      return response.text ?? 'No response.';
    } catch (e) {
      return 'Error: $e';
    }
  }
}
