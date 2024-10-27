import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeColors {
  // * Nijika Ijichi Theme - Warm Yellow Base
  static const nijikaTheme = {
    'primary': Color(0xFFE6D47B), // * Warm yellow
    'primaryLight': Color(0xFFF2E6A9), // * Lighter warm yellow
    'primaryDark': Color(0xFFBFAE4F), // * Darker warm yellow
    'accent': Color(0xFF7B9E87), // * Sage green accent
    'accentLight': Color(0xFF9DBEA8), // * Light sage
    'accentDark': Color(0xFF5C7E66), // * Dark sage
    'background': Color(0xFFFFFBE6), // * Soft warm background
    'surface': Colors.white,
    'textPrimary': Color(0xFF2D2A12), // * Deep warm gray
    'textSecondary': Color(0xFF625E47), // * Medium warm gray
    'success': Color(0xFF7B9E87), // * Sage green
    'warning': Color(0xFFE6B800), // * Golden yellow
    'error': Color(0xFFD47B7B), // * Soft red
    'inputBackground': Color(0xFFFFFDF5), // * Sangat soft warm white
    'inputBorder': Color(0xFFE6D47B), // * Menggunakan primary sebagai border
    'inputFocusBorder':
        Color(0xFFBFAE4F), // * Menggunakan primaryDark untuk focus
  };

  // * Ikuyo Kita Theme - Red Base (Enhanced)
  static const ikuyoTheme = {
    'primary': Color(0xFFD0574E), // * Warm red
    'primaryLight': Color(0xFFE57373), // * Lighter red
    'primaryDark': Color(0xFFA83E3E), // * Darker red
    'accent': Color(0xFF4ECDC4), // * Turquoise accent
    'accentLight': Color(0xFF7EDFD9), // * Light turquoise
    'accentDark': Color(0xFF2B9D94), // * Dark turquoise
    'background': Color(0xFFFFF5F5), // * Soft warm background
    'surface': Colors.white,
    'textPrimary': Color(0xFF2B1414), // * Deep warm gray
    'textSecondary': Color(0xFF614444), // * Medium warm gray
    'success': Color(0xFF4CAF50), // * Green
    'warning': Color(0xFFFFC107), // * Amber
    'error': Color(0xFFE53935), // * Red
    'inputBackground': Color(0xFFFFF8F8), // * Sangat soft red white
    'inputBorder':
        Color(0xFFE57373), // * Menggunakan primaryLight sebagai border
    'inputFocusBorder': Color(0xFFD0574E), // * Menggunakan primary untuk focus'
  };

  // * Ryo Yamada Theme - Navy Blue Base
  static const ryoTheme = {
    'primary': Color(0xFF4061A0), // * Navy blue
    'primaryLight': Color(0xFF6B84BC), // * Lighter navy
    'primaryDark': Color(0xFF2B4573), // * Darker navy
    'accent': Color(0xFFA08940), // * Gold accent
    'accentLight': Color(0xFFBCA76B), // * Light gold
    'accentDark': Color(0xFF736128), // * Dark gold
    'background': Color(0xFFF5F8FF), // * Soft cool background
    'surface': Colors.white,
    'textPrimary': Color(0xFF141B2B), // * Deep cool gray
    'textSecondary': Color(0xFF444961), // * Medium cool gray
    'success': Color(0xFF4CAF50), // * Green
    'warning': Color(0xFFFFB74D), // * Orange
    'error': Color(0xFFEF5350), // * Red
    'inputBackground': Color(0xFFF8FAFF), // * Sangat soft blue white
    'inputBorder':
        Color(0xFF6B84BC), // * Menggunakan primaryLight sebagai border
    'inputFocusBorder': Color(0xFF4061A0), // * Menggunakan primary untuk focus
  };

  // * Hitori Gotoh (Bocchi) Theme - Pink Base
  static const bocchiTheme = {
    'primary': Color(0xFFEEB8C4), // * Soft pink
    'primaryLight': Color(0xFFF7D4DC), // * Lighter pink
    'primaryDark': Color(0xFFC694A0), // * Darker pink
    'accent': Color(0xFF8FB8C4), // * Soft blue accent
    'accentLight': Color(0xFFADD1DC), // * Light blue
    'accentDark': Color(0xFF6B919C), // * Dark blue
    'background': Color(0xFFFFF5F8), // * Soft pink background
    'surface': Colors.white,
    'textPrimary': Color(0xFF2B1419), // * Deep warm gray
    'textSecondary': Color(0xFF614450), // * Medium warm gray
    'success': Color(0xFF81C784), // * Soft green
    'warning': Color(0xFFFFCC80), // * Soft orange
    'error': Color(0xFFE57373), // * Soft red
    'inputBackground': Color(0xFFFFF8FA), // * Sangat soft pink white
    'inputBorder':
        Color(0xFFF7D4DC), // * Menggunakan primaryLight sebagai border
    'inputFocusBorder': Color(0xFFEEB8C4), // * Menggunakan primary untuk focus
  };
}

// * Function to create ThemeData from color map
ThemeData createThemeData(Map<String, Color> colors) {
  return ThemeData(
    useMaterial3: true,
    primaryColor: colors['primary'],
    primaryColorLight: colors['primaryLight'],
    primaryColorDark: colors['primaryDark'],
    hintColor: colors['accent'],
    scaffoldBackgroundColor: colors['background'],
    textTheme: TextTheme(
      displayLarge: TextStyle(
        // * 96px - Sangat besar, untuk splash screen atau intro
        color: colors['textPrimary'],
        fontSize: 96,
      ),
      displayMedium: TextStyle(
        // * 60px - Ukuran untuk judul utama yang dramatis
        color: colors['textPrimary'],
        fontSize: 60,
      ),
      displaySmall: TextStyle(
        // * 48px - Ukuran untuk judul yang menonjol
        color: colors['textPrimary'],
        fontSize: 48,
      ),
      headlineMedium: TextStyle(
        // * 34px - Ukuran untuk heading level 1
        color: colors['textPrimary'],
        fontSize: 34,
      ),
      headlineSmall: TextStyle(
        // * 24px - Ukuran untuk heading level 2
        color: colors['textPrimary'],
        fontSize: 24,
      ),
      titleLarge: TextStyle(
        // * 20px - Ukuran untuk judul card atau dialog
        color: colors['textPrimary'],
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        // * 16px - Ukuran untuk subtitle atau menu items
        color: colors['textSecondary'],
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        // * 14px - Ukuran untuk caption atau helper text
        color: colors['textSecondary'],
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        // * 16px - Ukuran untuk body text utama
        color: colors['textPrimary'],
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        // * 14px - Ukuran untuk body text sekunder
        color: colors['textSecondary'],
        fontSize: 14,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: colors['primary'],
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        color: colors['surface'],
        fontSize: 20,
      ),
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: colors['primary']!,
      primary: colors['primary']!,
      secondary: colors['accent']!,
      surface: colors['surface']!,
      error: colors['error']!,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: colors['textPrimary']!,
      onError: Colors.white,
      surfaceTint: colors['primaryLight']!,
      surfaceContainerHighest: colors['background']!,
      onSurfaceVariant: colors['textSecondary']!,
    ),
  );
}

// * Create the actual themes
final nijikaTheme = createThemeData(ThemeColors.nijikaTheme);
final ikuyoTheme = createThemeData(ThemeColors.ikuyoTheme);
final ryoTheme = createThemeData(ThemeColors.ryoTheme);
final bocchiTheme = createThemeData(ThemeColors.bocchiTheme);
