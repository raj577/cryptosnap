import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/crypto_bloc.dart';
import 'bloc/crypto_event.dart';
import 'repository/crypto_repository.dart';
import 'services/api_service.dart';
import 'ui/home_page.dart';

void main() {
  final cryptoRepository = CryptoRepository(apiService: ApiService());

  runApp(CryptoPulseApp(repository: cryptoRepository));
}

class CryptoPulseApp extends StatelessWidget {
  final CryptoRepository repository;

  const CryptoPulseApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoSnap',
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (_) => CryptoBloc(repository: repository)..add(LoadCryptos()),
        child: const HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
