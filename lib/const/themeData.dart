import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: Color.fromARGB(255, 156, 208, 171),
          onPrimary: const Color.fromRGBO(255, 255, 255, 1),
          onSurface: Colors.grey,
          secondary: const Color.fromRGBO(29, 30, 32, 1),
          onSecondary: Colors.blue,
          surface: const Color.fromRGBO(245, 246, 250, 1),
          tertiary: const Color.fromARGB(255, 110, 108, 108),
          // onBackground: const Color.fromRGBO(255, 87, 87, 1)
        ),
  );
}
