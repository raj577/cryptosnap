abstract class GeminiState {}

class GeminiInitial extends GeminiState {}

class GeminiLoading extends GeminiState {}

class GeminiLoaded extends GeminiState {
  final String answer;
  GeminiLoaded(this.answer);
}

class GeminiError extends GeminiState {
  final String message;
  GeminiError(this.message);
}
