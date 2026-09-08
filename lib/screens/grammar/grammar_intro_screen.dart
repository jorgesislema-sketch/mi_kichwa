import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class GrammarIntroScreen extends StatelessWidget {
  const GrammarIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: const CustomAppBar(
          title: 'Bases del Kichwa',
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.orange,
            tabs: [
              Tab(icon: Icon(Icons.record_voice_over), text: 'Fonética'),
              Tab(icon: Icon(Icons.g_translate), text: 'Gramática'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Regla de las 3 vocales: En Kichwa únicamente se estructuran expresiones con las vocales A, I, U.',
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Estructura SOV: El verbo se posiciona estrictamente al término de la oración.',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/vocabulary'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text(
              'Ir al Vocabulario',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
