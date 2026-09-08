import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/kichwa_provider.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/word_card_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: const CustomAppBar(title: 'Mis Favoritos'),
      body: Consumer<KichwaProvider>(
        builder: (context, provider, child) {
          final favs = provider.favoriteWords;
          if (favs.isEmpty) {
            return const Center(
              child: Text('No tienes marcadores guardados todavía.'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favs.length,
            itemBuilder: (context, index) => WordCardWidget(word: favs[index]),
          );
        },
      ),
    );
  }
}
