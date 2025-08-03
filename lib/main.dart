import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'components/navigation_drawer.dart';

void main() {
  runApp(const LevelingSystemApp());
}

class LevelingSystemApp extends StatelessWidget {
  const LevelingSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infiniteverse Leveling System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}
