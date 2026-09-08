import 'package:flutter/material.dart';

import '../models/word_model.dart';

class KichwaProvider with ChangeNotifier {
  final List<WordModel> _words = [
    WordModel(
      id: '1',
      kichwa: 'Shuk',
      espanol: 'Uno',
      ejemplo: 'Shuk killa (Un mes).',
      categoria: 'Números',
    ),
    WordModel(
      id: '2',
      kichwa: 'Awaki',
      espanol: 'Lunes',
      ejemplo: 'Awaki punlla shamuni.',
      categoria: 'Días de la semana',
    ),
    WordModel(
      id: '3',
      kichwa: 'Uturunku',
      espanol: 'Jaguar',
      ejemplo: 'Uturunku sachapi kawsan.',
      categoria: 'Animales salvajes',
    ),
    WordModel(
      id: '4',
      kichwa: 'Palanta',
      espanol: 'Plátano',
      ejemplo: 'Ñuka palantata mikuni.',
      categoria: 'Frutas',
    ),
    WordModel(
      id: '5',
      kichwa: 'Ankas',
      espanol: 'Azul',
      ejemplo: 'Ankas jahua pacha.',
      categoria: 'Colores',
    ),
    WordModel(
      id: '6',
      kichwa: 'Sacha',
      espanol: 'Naturaleza / Selva',
      ejemplo: 'Sachaman rinchik.',
      categoria: 'La naturaleza',
      imageUrl: 'https://unsplash.com',
    ),
  ];

  int _selectionIndex = 0;

  List<WordModel> get words => _words;
  List<WordModel> get favoriteWords =>
      _words.where((w) => w.isFavorite).toList();
  int get selectionIndex => _selectionIndex;
  WordModel get currentSelectionWord => _words[_selectionIndex % _words.length];

  void toggleFavorite(String id) {
    final index = _words.indexWhere((w) => w.id == id);
    if (index >= 0) {
      _words[index].isFavorite = !_words[index].isFavorite;
      notifyListeners(); // 📢 Actualiza instantáneamente todas las pantallas
    }
  }

  void nextSelectionWord() {
    _selectionIndex = (_selectionIndex + 1) % _words.length;
    notifyListeners();
  }
}
