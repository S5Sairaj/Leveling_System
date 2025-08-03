import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFF8F7FC),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFF8F7FC),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Color(0xFF5B4B8A),
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(color: Color(0xFF5B4B8A)),
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF5B4B8A)),
    titleLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xFF5B4B8A)),
    bodyLarge: TextStyle(fontSize: 16),
  ),
);
