import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/crypto_bloc.dart';
import 'bloc/crypto_event.dart';
import 'repository/crypto_repository.dart';
import 'services/api_service.dart';
import 'ui/home_page.dart';
import 'gemini/gemini_bloc.dart';
import 'gemini/gemini_repository.dart';
import 'constants/api_keys.dart'; // Define geminiApiKey inside this file
import 'ui/gemini_chat_page.dart'; // <-- Add this import

void main() {
  final cryptoRepository = CryptoRepository(apiService: ApiService());
  final geminiRepository = GeminiRepository(geminiApiKey);

  runApp(CryptoPulseApp(
    cryptoRepository: cryptoRepository,
    geminiRepository: geminiRepository,
  ));
}

class CryptoPulseApp extends StatelessWidget {
  final CryptoRepository cryptoRepository;
  final GeminiRepository geminiRepository;

  const CryptoPulseApp({
    super.key,
    required this.cryptoRepository,
    required this.geminiRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CryptoBloc(repository: cryptoRepository)..add(LoadCryptos()),
        ),
        BlocProvider(
          create: (_) => GeminiBloc(repository: geminiRepository),
        ),
      ],
      child: MaterialApp(
        title: 'CryptoSnap',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          '/gemini': (context) => const GeminiChatPage(),
        },
      ),
    );
  }
}
