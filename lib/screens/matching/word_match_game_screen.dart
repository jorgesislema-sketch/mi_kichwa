import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WordMatchGameScreen extends StatelessWidget {
  const WordMatchGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: const Text(
          'Relacionar con Fotos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal[700],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Visualiza el objeto y aprende su escritura:',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: 'https://unsplash.com',
                      placeholder: (context, url) => const SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, size: 50),
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Divider(height: 30),
                    Text(
                      'Sacha',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                    ),
                    Text(
                      '(Naturaleza / Selva)',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
