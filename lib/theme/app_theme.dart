import 'package:flutter/material.dart';

/// Clase para manejar los colores y estilos consistentes en toda la app
/// Basados en el sitio web de la Municipalidad de Villarrica
class AppTheme {
  // Colores principales
  static const Color primaryBlue = Color(0xFF004A98);    // Azul institucional
  static const Color secondaryBlue = Color(0xFF0066CC);  // Azul secundario
  static const Color accent = Color(0xFFE31E24);         // Rojo para acentos
  
  // Colores de texto
  static const Color textDark = Color(0xFF333333);       // Texto principal
  static const Color textLight = Color(0xFF666666);      // Texto secundario
  
  // Colores de fondo
  static const Color background = Color(0xFFF5F5F5);     // Fondo principal
  static const Color surfaceWhite = Colors.white;        // Fondo de tarjetas
  
  // Colores de estado
  static const Color success = Color(0xFF28A745);        // Verde para éxito
  static const Color warning = Color(0xFFFFC107);        // Amarillo para advertencias
  static const Color error = Color(0xFFDC3545);          // Rojo para errores

  static ThemeData get theme => ThemeData(
    primaryColor: primaryBlue,
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme.light(
      primary: primaryBlue,
      secondary: secondaryBlue,
      error: error,
      background: background,
      surface: surfaceWhite,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryBlue,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: textDark,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: textDark,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: textDark,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: textDark,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: textDark,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: textDark,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: textLight,
        fontSize: 14,
      ),
    ),
    cardTheme: CardThemeData(
      color: surfaceWhite,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: primaryBlue,
      size: 24,
    ),
  );
}