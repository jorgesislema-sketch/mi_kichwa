import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioLessonsScreen extends StatelessWidget {
  const AudioLessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Estructura de datos para las futuras lecciones de audio
    final List<Map<String, String>> audioLessons = [
      {
        'title': 'Pronunciación de Vocales',
        'phrase': 'A - I - U en Kichwa',
        'audioPath': 'https://soundhelix.com', // Enlace de prueba
      },
      {
        'title': 'Saludos Comunes',
        'phrase': 'Alli punlla, Alli chishi, Alli tuta',
        'audioPath': 'https://soundhelix.com', // Enlace de prueba
      },
      {
        'title': 'Expresiones de Agradecimiento',
        'phrase': 'Añay, Pagarachu',
        'audioPath': 'https://soundhelix.com', // Enlace de prueba
      },
    ];

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(
          'Escucha y Aprende',
          style: GoogleFonts.philosopher(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: audioLessons.length,
        itemBuilder: (context, index) {
          final lesson = audioLessons[index];
          // REQUERIMIENTO: Un widget independiente por cada lección
          return AudioPlayerCardWidget(
            title: lesson['title']!,
            phrase: lesson['phrase']!,
            audioUrl: lesson['audioPath']!,
          );
        },
      ),
    );
  }
}

// ========================================================
// WIDGET INDEPENDIENTE DE REPRODUCTOR (AudioPlayerCardWidget)
// ========================================================
class AudioPlayerCardWidget extends StatefulWidget {
  final String title;
  final String phrase;
  final String audioUrl;

  const AudioPlayerCardWidget({
    super.key,
    required this.title,
    required this.phrase,
    required this.audioUrl,
  });

  @override
  State<AudioPlayerCardWidget> createState() => _AudioPlayerCardWidgetState();
}

class _AudioPlayerCardWidgetState extends State<AudioPlayerCardWidget> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Escuchar los cambios de estado del reproductor
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
        });
      }
    });

    // Escuchar la duración total del audio
    _audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          _duration = newDuration;
        });
      }
    });

    // Escuchar la posición actual de la reproducción
    _audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          _position = newPosition;
        });
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Liberar memoria del teléfono al salir
    super.dispose();
  }

  // Controlar la reproducción de audio online
  void _playPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(widget.audioUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 14.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[700],
                  child: const Icon(Icons.volume_up, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      Text(
                        widget.phrase,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.grey[700],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                // Botón interactivo Play/Pause
                IconButton(
                  icon: Icon(
                    _isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled,
                  ),
                  iconSize: 45,
                  color: Colors.blue[700],
                  onPressed: _playPause,
                ),
              ],
            ),
            if (_duration != Duration.zero) ...[
              const SizedBox(height: 10),
              Slider(
                min: 0,
                max: _duration.inMilliseconds.toDouble(),
                value: _position.inMilliseconds.toDouble().clamp(
                  0.0,
                  _duration.inMilliseconds.toDouble(),
                ),
                onChanged: (value) async {
                  final position = Duration(milliseconds: value.toInt());
                  await _audioPlayer.seek(position);
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
