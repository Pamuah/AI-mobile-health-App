import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(context) {
  return ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.playTextTheme(
      Theme.of(context).textTheme,
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ThemeData().colorScheme.copyWith(
        primary: const Color.fromARGB(255, 156, 208, 171),
        onPrimary: const Color.fromRGBO(255, 255, 255, 1),
        onSurface: Colors.grey,
        secondary: const Color.fromRGBO(29, 30, 32, 1),
        onSecondary: Colors.blue,
        surface: const Color.fromRGBO(245, 246, 250, 1),
        tertiary: const Color.fromARGB(255, 110, 108, 108),
        onTertiary: const Color.fromARGB(255, 245, 132, 132)),
  );
}
