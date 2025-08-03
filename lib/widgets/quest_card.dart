import 'package:flutter/material.dart';

class QuestCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int exp;
  final VoidCallback onActivate;

  const QuestCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.exp,
    required this.onActivate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(subtitle),
            const SizedBox(height: 12),
            Text('EXP: $exp', style: const TextStyle(color: Colors.deepPurple)),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: onActivate,
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6A4BC2)),
              child: const Text('Activate'),
            ),
          ],
        ),
      ),
    );
  }
}
