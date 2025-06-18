import 'package:flutter_bloc/flutter_bloc.dart';
import 'crypto_event.dart';
import 'crypto_state.dart';
import '../repository/crypto_repository.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository repository;

  CryptoBloc({required this.repository}) : super(CryptoInitial()) {
    on<LoadCryptos>((event, emit) async {
      emit(CryptoLoading());
      try {
        final cryptos = await repository.getTopCryptos();
        emit(CryptoLoaded(cryptos: cryptos));
      } catch (e) {
        emit(CryptoError(message: e.toString()));
      }
    });
  }
}
