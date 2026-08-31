import 'package:flutter/material.dart';

import 'screens/home/home_screen.dart';
import 'screens/grammar/grammar_intro_screen.dart';
import 'screens/vocabulary/vocabulary_screen.dart';
import 'screens/selection/word_selection_screen.dart';
import 'screens/matching/word_match_game_screen.dart';
import 'screens/stories/stories_screen.dart';
import 'screens/audios/audio_lessons_screen.dart';

void main() {
  runApp(const KichwaApp());
}

class KichwaApp extends StatelessWidget {
  const KichwaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aprende Kichwa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/grammar_intro': (context) => const GrammarIntroScreen(),
        '/vocabulary': (context) => const VocabularyScreen(),
        '/selection': (context) => const WordSelectionScreen(),
        '/match_game': (context) => const WordMatchGameScreen(),
        '/stories': (context) => const StoriesScreen(),
        '/audios': (context) => const AudioLessonsScreen(),
      },
    );
  }
}
