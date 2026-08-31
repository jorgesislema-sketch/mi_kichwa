import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GrammarIntroScreen extends StatelessWidget {
  const GrammarIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.amber[50],
        appBar: AppBar(
          title: Text(
            'Bases del Kichwa',
            style: GoogleFonts.philosopher(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.teal[700],
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.orange,
            tabs: [
              Tab(icon: Icon(Icons.record_voice_over), text: 'Fonética'),
              Tab(icon: Icon(Icons.g_translate), text: 'Gramática'),
            ],
          ),
        ),
        body: const TabBarView(children: [PhoneticsTab(), GrammarTab()]),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            onPressed: () => Navigator.pushNamed(context, '/vocabulary'),
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            label: Text(
              'Ir al Vocabulario',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange[700],
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneticsTab extends StatelessWidget {
  const PhoneticsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> rules = [
      {
        'title': 'Las 3 Vocales',
        'desc': 'El kichwa solo utiliza tres vocales de forma nativa: A, I, U. No existen las vocales E ni O en palabras puras.',
      },
      {
        'title': 'La letra "W"',
        'desc': 'Se pronuncia similar a la "u" en diptongos ingleses. Ejemplo: "Wawa" (bebé) se pronuncia "huahua".',
      },
      {
        'title': 'La letra "Y"',
        'desc': 'Cumple una función consonántica y suena como la "y" del español. Ejemplo: "Yaya" (padre).',
      },
      {
        'title': 'Sin acento ortográfico',
        'desc': 'En el kichwa no se usan tildes. La gran mayoría de palabras son graves, acentuadas en la penúltima sílaba.',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: rules.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.teal[700],
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rules[index]['title']!,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[700],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        rules[index]['desc']!,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class GrammarTab extends StatelessWidget {
  const GrammarTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> rules = [
      {
        'title': 'Estructura SOV',
        'desc': 'El verbo siempre va al final: Sujeto + Objeto + Verbo. Ejemplo: "Ñuka tantata mikuni" (Yo pan como).',
      },
      {
        'title': 'Idioma Aglutinante',
        'desc': 'El kichwa no usa preposiciones sueltas. En su lugar, añade "sufijos" al final de las palabras para cambiar su función.',
      },
      {
        'title': 'El Sufijo "-pak"',
        'desc': 'Indica pertenencia (posesivo). Equivale al "de" en español. Ejemplo: "Kanpak" (De ti / Tuyo).',
      },
      {
        'title': 'Sin Género Gramatical',
        'desc': 'Las palabras no tienen género masculino o femenino. Se añade "kari" (macho) o "warmi" (hembra) si se requiere especificar.',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: rules.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.orange[700],
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rules[index]['title']!,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[700],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        rules[index]['desc']!,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
