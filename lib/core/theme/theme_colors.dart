import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  // primarySwatch: Colors.green,
  colorScheme: _lightScheme,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: _lightScheme.primary,
    foregroundColor: _lightScheme.onPrimary,
  ),
);

final darkTheme = ThemeData(
  colorScheme: _darkScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: _darkScheme.primary,
    foregroundColor: _darkScheme.onPrimary,
  ),
);

final _darkScheme = ColorScheme.fromSeed(
  seedColor: Colors.green,
  brightness: Brightness.dark,
);
final _lightScheme = ColorScheme.fromSeed(
  seedColor: Colors.green,
  brightness: Brightness.light,
);
