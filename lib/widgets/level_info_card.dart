import 'package:flutter/material.dart';

class LevelInfoCard extends StatelessWidget {
  final int level;
  final int exp;

  const LevelInfoCard({super.key, required this.level, required this.exp});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Level: $level', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 5),
            Text('EXP: $exp / 50', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
