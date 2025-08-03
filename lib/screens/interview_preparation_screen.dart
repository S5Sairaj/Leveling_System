import 'package:flutter/material.dart';

class InterviewPreparationScreen extends StatelessWidget {
  const InterviewPreparationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interview Preparation')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: const [
            Text(
              'Problem: Last Stone Weight',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'You are given an array of integers stones where stones[i] is the weight of the ith stone...\n\n'
              'On each turn, smash the two heaviest stones. Return the weight of the last stone left (or 0).',
            ),
            SizedBox(height: 20),
            Text(
              'Expected Solution (Leetcode): Priority Queue / Max-Heap',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
