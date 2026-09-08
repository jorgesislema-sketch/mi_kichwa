import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../providers/kichwa_provider.dart';
import '../../widgets/custom_app_bar.dart';

class WordMatchGameScreen extends StatelessWidget {
  const WordMatchGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: const CustomAppBar(title: 'Asociación Visual'),
      body: Consumer<KichwaProvider>(
        builder: (context, provider, child) {
          // Tomamos la palabra que tiene imagen en nuestro proveedor
          final targetWord = provider.words.firstWhere(
            (w) => w.imageUrl != null,
          );
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CachedNetworkImage(
                      imageUrl: targetWord.imageUrl!,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const Divider(height: 30),
                    Text(
                      targetWord.kichwa,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    Text(
                      '(${targetWord.espanol})',
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 10),
                    IconButton(
                      icon: Icon(
                        targetWord.isFavorite
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                      ),
                      color: Colors.orange,
                      onPressed: () => provider.toggleFavorite(targetWord.id),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
