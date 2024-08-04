import 'package:flutter/material.dart';

class AppColors {
  AppColors();

  /// Common
  static const Color primary = Color(0xFF111827);
  static const Color secondary = Color(0xFF0A6375);

  static const Color background = Colors.white;

  static const Color white = Colors.white;
  static const Color black = Color(0xFF111827);

  static const Color transparent = Colors.transparent;
  static const Color grey = Color(0xFF6b7280);
  static const Color offWhite = Color(0xFFF8ECE5);

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      return Color(int.parse('ff$hexColor', radix: 16));
    } else {
      return Colors.transparent;
    }
  }

  static const bool isDark = true;

  static ThemeData toThemeData() {
    /// Create a TextTheme and ColorScheme, that we can use to generate ThemeData
    TextTheme txtTheme =
        (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;

    ColorScheme colorScheme = ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        primaryContainer: primary,
        onPrimary: black,
        onPrimaryContainer: black,
        secondary: secondary,
        secondaryContainer: secondary,
        onSecondaryContainer: white,
        onSecondary: white,
        onTertiary: white,
        onTertiaryContainer: white,
        onError: white,
        errorContainer: Colors.red.shade200,
        onErrorContainer: white,
        error: Colors.red.shade400,
        surface: primary,
        onSurface: black);

    /// Now that we have ColorScheme and TextTheme, we can create the ThemeData
    /// Also add on some extra properties that ColorScheme seems to miss
    var theme =
        ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme).copyWith(
      textSelectionTheme: const TextSelectionThemeData(cursorColor: primary),
      unselectedWidgetColor: Colors.grey,
      highlightColor: primary,
    );

    /// Return the themeData which MaterialApp can now use
    return theme;
  }
}
