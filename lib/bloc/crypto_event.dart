import 'package:equatable/equatable.dart';

abstract class CryptoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadCryptos extends CryptoEvent {}