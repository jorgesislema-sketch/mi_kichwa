import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Números (hasta el 20)',
      'Días de la semana',
      'Meses del año',
      'Animales salvajes',
      'Animales caseros',
      'Frutas',
      'Alimentos',
      'La naturaleza',
      'Colores',
      'Objetos en casa',
    ];

    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: const Text(
          'Categorías de Vocabulario',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal[700],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal[700],
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                categories[index],
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Cargando vocabulario de: ${categories[index]}',
                    ),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.teal[600],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
