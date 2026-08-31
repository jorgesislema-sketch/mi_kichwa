import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cuentos = [
      {
        'title': 'El Cóndor y la Pastora',
        'subtitle': 'Kunturmantas Pasñamantas yachay',
        'description':
            'Un cuento clásico de los Andes sobre el amor y la naturaleza.',
        'pdfUrl': 'https://educo.org',
      },
      {
        'title': 'El rastro del Jaguar',
        'subtitle': 'Uturunku yupikuna',
        'description':
            'Aventura en la Amazonía descubriendo los secretos de la selva.',
        'pdfUrl': 'https://unicef.org',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: Text(
          'Cuentos Kichwa - Español',
          style: GoogleFonts.philosopher(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.teal[700],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: cuentos.length,
        itemBuilder: (context, index) {
          final cuento = cuentos[index];
          return StoryCardWidget(
            title: cuento['title']!,
            subtitle: cuento['subtitle']!,
            description: cuento['description']!,
            pdfUrl: cuento['pdfUrl']!,
          );
        },
      ),
    );
  }
}

class StoryCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String pdfUrl;

  const StoryCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.pdfUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.orange[700],
                  child: const Icon(Icons.auto_stories, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[700],
                        ),
                      ),
                      Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 25),
            Text(
              description,
              style: GoogleFonts.lato(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PdfViewerScreen(title: title, pdfUrl: pdfUrl),
                    ),
                  );
                },
                icon: const Icon(Icons.menu_book, color: Colors.white),
                label: const Text(
                  'Leer Cuento',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PdfViewerScreen extends StatelessWidget {
  final String title;
  final String pdfUrl;

  const PdfViewerScreen({super.key, required this.title, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.teal[700],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const PDF().cachedFromUrl(
        pdfUrl,
        placeholder: (progress) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(color: Colors.teal),
              const SizedBox(height: 10),
              Text('Cargando cuento digital...'),
            ],
          ),
        ),
        errorWidget: (error) =>
            const Center(child: Text('Error al cargar el PDF digital online.')),
      ),
    );
  }
}
