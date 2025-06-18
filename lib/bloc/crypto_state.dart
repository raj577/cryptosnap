import 'package:equatable/equatable.dart';
import '../models/crypto_model.dart';

abstract class CryptoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CryptoInitial extends CryptoState {}

class CryptoLoading extends CryptoState {}

class CryptoLoaded extends CryptoState {
  final List<Crypto> cryptos;

  CryptoLoaded({required this.cryptos});

  @override
  List<Object?> get props => [cryptos];
}

class CryptoError extends CryptoState {
  final String message;

  CryptoError({required this.message});

  @override
  List<Object?> get props => [message];
}
