# Yachakushun Kichwa - Aplicación Móvil Educativa

Módulo interactivo y pedagógico diseñado para la enseñanza, difusión y preservación del idioma Kichwa mediante entornos móviles dinámicos.

---

## Actividad Integradora 2: Mejoras y Nuevas Funcionalidades

### Descripción Breve de la Aplicación
"Yachakushun Kichwa" es una aplicación móvil interactiva orientada a la inmersión lingüística en el idioma Kichwa. Su propósito central es guiar al estudiante de forma progresiva, partiendo desde los fundamentos fonéticos y gramaticales andinos, pasando por la categorización léxica, hasta llegar a retos interactivos multimedia como la validación escrita y el emparejamiento visual de elementos culturales.

### Continuidad del Proyecto
*   **Estado:** **Se continuó y expandió el desarrollo de la Actividad Integradora 1**. Se migró la aplicación de una arquitectura monolítica estática (una única pantalla principal) a un patrón de diseño completamente desacoplado y multipantalla, organizando el código de forma limpia mediante subcarpetas independientes según su funcionalidad dentro del directorio `lib/screens/`.

### Descripción de las Nuevas Funcionalidades Implementadas
1.  **Arquitectura Modular por Carpetas:** Estructura limpia donde cada funcionalidad y vista reside en su propio subdirectorio contenedor, optimizando la escalabilidad y legibilidad.
2.  **Enrutamiento Declarativo Centralizado:** Implementación del mapa de navegación por rutas nominadas en el archivo principal.
3.  **Introducción Lingüística Avanzada:** Pantalla puente que instruye al alumno en la teoría de las tres vocales puras y el orden sintáctico Sujeto-Objeto-Verbo (SOV).
4.  **Clasificación de Vocabulario Dinámica:** Organización estructurada del léxico en diez grupos específicos con confirmaciones hápticas.
5.  **Motor de Cuentos PDF Online:** Módulo integrado que descarga en caché, previsualiza y libera en memoria los archivos digitales sin almacenamiento físico residual.
6.  **Sistema Multimedia de Audio:** Reproductor dinámico de lecciones sonoras con barra de progreso interactiva sincronizada.

---

### Listado de las 6 Pantallas Desarrolladas y su Función

1.  **Menú Principal (`home_screen.dart`):** Distribución en cuadrícula interactiva que centraliza los accesos hacia todas las funciones y presenta la identidad corporativa de la app.
2.  **Introducción Lingüística (`grammar_intro_screen.dart`):** Vista teórica dividida por pestañas que desglosa las normas fonéticas y sintácticas previas a la práctica de vocabulario.
3.  **Categorías de Vocabulario (`vocabulary_screen.dart`):** Lista scannable que agrupa los 10 bloques conceptuales obligatorios solicitados (números hasta el 20, días, meses, animales salvajes, animales caseros, frutas, alimentos, naturaleza, colores y objetos).
4.  **Selección de Palabras (`word_selection_screen.dart`):** Entorno interactivo de traducción cruzada (Español-Kichwa) con mutación de datos en pantalla.
5.  **Emparejar con Fotos (`word_match_game_screen.dart`):** Dinámica visual de asociación que conecta términos en Kichwa con imágenes representativas optimizadas desde la nube.
6.  **Lecciones de Audio (`audio_lessons_screen.dart`):** Reproductor nativo dedicado al entrenamiento del aparato fonador mediante el análisis acústico de palabras complejas.

---

### Widgets Utilizados en el Proyecto

La aplicación integra de forma obligatoria los siguientes widgets nativos expuestos en clase:
*   `ListView.builder` / `GridView.builder` (Renderizado dinámico de colecciones).
*   `ListTile` / `Card` / `CircleAvatar` / `Divider` (Diseño atómico de contenedores y filas).
*   `TabBar` / `TabBarView` / `DefaultTabController` (Gestión avanzada de navegación por pestañas).
*   `Padding` / `SizedBox` / `Expanded` / `Container` (Control estricto de layouts, márgenes y flexibilidades).
*   `ElevatedButton.icon` / `IconButton` / `Slider` (Componentes interactivos y controladores multimedia).

---

### Descripción de las Interacciones Implementadas
*   **Navegación Fluida:** Desplazamiento limpio entre capas del sistema mediante el uso de `Navigator.pushNamed` para rutas registradas y `Navigator.push` con `MaterialPageRoute` para la apertura de vistas independientes (visor de PDF).
*   **Mensajería Contextual:** Retroalimentación inmediata al usuario mediante el despliegue de barras flotantes dinámicas (`SnackBar`) al presionar los ítems del vocabulario.

### Explicación de la Funcionalidad mediante `setState()`
El estado mutable se gestiona de manera transparente mediante dos implementaciones clave:
*   En **`WordSelectionScreen`**, la acción del usuario modifica un índice numérico (`_selectedIndex`), obligando a la interfaz a refrescar el término textual sin afectar el árbol global de widgets.
*   En **`AudioPlayerCardWidget`**, el método escucha los flujos asíncronos nativos de reproducción para mutar dinámicamente las variables de control (`_isPlaying`, `_duration`, `_position`), actualizando la posición exacta de los componentes gráficos y el icono del botón.

---

### Paquetes Externos Utilizados
*   **`google_fonts`:** Proporciona un acabado estético profesional mediante tipografías globales especializadas (`Poppins`, `Lato`, `Philosopher`).
*   **`cached_network_image`:** Descarga y guarda en memoria temporal imágenes educativas desde internet, impidiendo recargas redundantes de datos móviles.
*   **`flutter_cached_pdfview`:** Renderiza documentos PDF alojados en servidores externos en tiempo real, garantizando su visualización en una sola pulsación.
*   **`audioplayers`:** Interactúa con los servicios de sonido nativos del sistema operativo para ejecutar streams de audio fluidos y controlar sliders de tiempo.

---

### Evidencia de Personalización Realizada
*   **Nombre Oficial:** "Aprende Kichwa" (Configurado directamente en las propiedades del launcher del manifiesto nativo de Android).
*   **Logotipo e Imagen:** Logotipo emblemático corporativo embebido de forma digital en el contenedor superior del Menú Principal.
*   **Paleta de Colores Cultural:** Uso sistemático de una base cromática andina cálida:
    *   *Color Primario:* `Colors.teal` (Identidad y cultura).
    *   *Color de Acento:* `Colors.orange` / `Colors.blue` / `Colors.red`.
    *   *Fondo General:* `Colors.amber` (Suave y de alto contraste pedagógico).
*   **Sintaxis de Vanguardia:** Eliminación completa de miembros obsoletos (`withOpacity`) reemplazándolos por el estándar matemático moderno `.withValues(alpha: ...)`.

---

### Instrucciones Básicas para Ejecutar el Proyecto
1.  Clonar el repositorio localmente mediante Git.
2.  Asegurar una conexión estable a internet (requerido para los cuentos PDF y las imágenes).
3.  Ejecutar el comando de limpieza y descarga de dependencias en la terminal:
    ```bash
    flutter pub get
    ```
4.  Conectar un dispositivo físico con depuración USB activa o encender un emulador virtual.
5.  Compilar y lanzar la aplicación ejecutando:
    ```bash
    flutter run
    ```