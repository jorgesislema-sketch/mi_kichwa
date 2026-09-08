import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/word_model.dart';
import '../providers/kichwa_provider.dart';

class WordCardWidget extends StatelessWidget {
  final WordModel word;
  const WordCardWidget({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal,
          child: Text(
            word.kichwa[0],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          word.kichwa,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        subtitle: Text(
          '${word.espanol}\n${word.ejemplo}',
          style: GoogleFonts.lato(fontSize: 13),
        ),
        isThreeLine: true,
        trailing: IconButton(
          icon: Icon(word.isFavorite ? Icons.bookmark : Icons.bookmark_border),
          color: word.isFavorite ? Colors.orange : Colors.grey,
          onPressed: () =>
              context.read<KichwaProvider>().toggleFavorite(word.id),
        ),
      ),
    );
  }
}
