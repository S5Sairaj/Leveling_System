import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: const Color(0xFFF2EDFF),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Level 1',
                      style: TextStyle(fontSize: 24, color: Color(0xFF5B4B8A)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Keep pushing your limits!',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: 0.2,
                      backgroundColor: Colors.grey.shade300,
                      color: const Color(0xFF6A4BC2),
                      minHeight: 8,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '0 / 50 EXP',
                      style: TextStyle(color: Color(0xFF6A4BC2)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Active Quests Overview',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                title: const Text('No active daily quests.'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
