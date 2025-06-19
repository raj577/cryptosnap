import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../gemini/gemini_bloc.dart';
import '../gemini/gemini_event.dart';
import '../gemini/gemini_state.dart';

class GeminiChatPage extends StatelessWidget {
  const GeminiChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    const questions = [
      'What is Bitcoin?',
      'How does Ethereum work?',
      'Which coins are trending today?',
      'Explain blockchain in simple terms.',
      'What is the future of crypto?',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Ask Gemini")),
      body: Column(
        children: [
          BlocBuilder<GeminiBloc, GeminiState>(
            builder: (context, state) {
              if (state is GeminiInitial) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Select a question below to begin.'),
                );
              } else if (state is GeminiLoading) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                );
              } else if (state is GeminiLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(state.answer),
                );
              } else if (state is GeminiError) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(state.message, style: TextStyle(color: Colors.red)),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(questions[index]),
                  onTap: () {
                    context.read<GeminiBloc>().add(AskGemini(questions[index]));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
