import 'package:flutter_bloc/flutter_bloc.dart';
import 'gemini_event.dart';
import 'gemini_state.dart';
import 'gemini_repository.dart';

class GeminiBloc extends Bloc<GeminiEvent, GeminiState> {
  final GeminiRepository repository;
  String? _lastQuestion;

  GeminiBloc({required this.repository}) : super(GeminiInitial()) {
    on<AskGemini>((event, emit) async {
      if (event.question == _lastQuestion) return;
      _lastQuestion = event.question;

      emit(GeminiLoading());
      try {
        final answer = await repository.askGemini(event.question);
        emit(GeminiLoaded(answer));
      } catch (e) {
        emit(GeminiError('Failed to fetch answer: $e'));
      }
    });
  }
}
