import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/kichwa_provider.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/word_card_widget.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: const CustomAppBar(title: 'Vocabulario Global'),
      body: Consumer<KichwaProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.words.length,
            itemBuilder: (context, index) =>
                WordCardWidget(word: provider.words[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () => Navigator.pushNamed(context, '/favorites'),
        child: const Icon(Icons.bookmarks, color: Colors.white),
      ),
    );
  }
}
