import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WordSelectionScreen extends StatefulWidget {
  const WordSelectionScreen({super.key});

  @override
  State<WordSelectionScreen> createState() => _WordSelectionScreenState();
}

class _WordSelectionScreenState extends State<WordSelectionScreen> {
  final List<Map<String, String>> _options = [
    {'kichwa': 'Alli punlla', 'espanol': 'Buenos días'},
    {'kichwa': 'Añay', 'espanol': 'Gracias'},
    {'kichwa': 'Chishi', 'espanol': 'Tarde'},
    {'kichwa': 'Sumak kawsay', 'espanol': 'Buen vivir'},
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: const Text(
          'Seleccionar Palabra',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal[700],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '¿Cómo se dice "${_options[_selectedIndex]['espanol']}" en Kichwa?',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Card(
              color: Colors.teal[700],
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  _options[_selectedIndex]['kichwa']!,
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = (_selectedIndex + 1) % _options.length;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[700],
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Cambiar Palabra',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
