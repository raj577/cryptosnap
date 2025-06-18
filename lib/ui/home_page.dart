import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../bloc/crypto_bloc.dart';
import '../bloc/crypto_state.dart';
import '../models/crypto_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoSnap'),
        centerTitle: true,
      ),
      body: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) {
          if (state is CryptoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CryptoLoaded) {
            return ListView.builder(
              itemCount: state.cryptos.length,
              itemBuilder: (context, index) {
                final crypto = state.cryptos[index];
                final priceChange = crypto.priceChangePercentage24h;
                final isPositive = priceChange >= 0;

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(crypto.image),
                  ),
                  title: Text(crypto.name),
                  subtitle: Text(crypto.symbol.toUpperCase()),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '₹ ${crypto.currentPrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${priceChange.toStringAsFixed(2)}%',
                        style: TextStyle(
                          color: isPositive ? Colors.green : Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is CryptoError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No Data'));
          }
        },
      ),
    );
  }
}
