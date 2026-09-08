import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista completa de los elementos del menú principal
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Vocabulario por Grupos',
        'icon': Icons.menu_book,
        'route': '/grammar_intro',
        'color': Colors.teal,
      },
      {
        'title': 'Cuentos PDF',
        'icon': Icons.picture_as_pdf,
        'route': '/stories',
        'color': Colors.red,
      },
      {
        'title': 'Lecciones Audio',
        'icon': Icons.audiotrack,
        'route': '/audios',
        'color': Colors.blue,
      },
      {
        'title': 'Seleccionar Palabras',
        'icon': Icons.ads_click,
        'route': '/selection',
        'color': Colors.purple,
      },
      {
        'title': 'Emparejar con Fotos',
        'icon': Icons.extension,
        'route': '/match_game',
        'color': Colors.orange,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.amber[50], // Fondo personalizado cálido y suave
      appBar: AppBar(
        title: Text(
          'Yachakushun Kichwa',
          style: GoogleFonts.philosopher(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Logotipo / Imagen Representativa estilizada mediante Container
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal[700],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.school, size: 55, color: Colors.white),
                  const SizedBox(width: 15),
                  Text(
                    'Kichwa Interactivo',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Grid interactivo para las 5 secciones de la aplicación
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Dos columnas fijas
                  crossAxisSpacing: 16, // Espaciado horizontal
                  mainAxisSpacing: 16, // Espaciado vertical
                  childAspectRatio: 1.1, // Proporción de tamaño
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, item['route']),
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              item['color']![600]!,
                              item['color']![800]!,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(item['icon'], size: 45, color: Colors.white),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                item['title'],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
