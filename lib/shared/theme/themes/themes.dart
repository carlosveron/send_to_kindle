import 'package:flutter/material.dart';
part 'color_schemes.g.dart';

ThemeData get lightTheme => ThemeData(
      colorScheme: _lightColorScheme,
      useMaterial3: true,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _darkColorScheme.primary,
      ),
      cardTheme: CardTheme(
        color: _lightColorScheme.onPrimary,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
    );

ThemeData get darkTheme => ThemeData(
      colorScheme: _darkColorScheme,
      useMaterial3: true,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightColorScheme.primary,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
    );
