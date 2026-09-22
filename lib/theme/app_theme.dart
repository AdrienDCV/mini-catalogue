import 'package:flutter/material.dart';

const _seedColor = Color(0xFF006A6A);

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: _seedColor),
    scaffoldBackgroundColor: const Color(0xFFF6F6F3),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF6F6F3),
      elevation: 0,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      elevation: 0,
    ),
  );
}