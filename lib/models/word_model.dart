class WordModel {
  final String id;
  final String kichwa;
  final String espanol;
  final String ejemplo;
  final String categoria;
  final String? imageUrl;
  bool isFavorite;

  WordModel({
    required this.id,
    required this.kichwa,
    required this.espanol,
    required this.ejemplo,
    required this.categoria,
    this.imageUrl,
    this.isFavorite = false,
  });
}
