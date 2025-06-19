abstract class GeminiEvent {}

class AskGemini extends GeminiEvent {
  final String question;
  AskGemini(this.question);
}
