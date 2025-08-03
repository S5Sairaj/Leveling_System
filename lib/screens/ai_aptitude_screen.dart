import 'package:flutter/material.dart';

class AIAptitudeScreen extends StatefulWidget {
  const AIAptitudeScreen({super.key});

  @override
  State<AIAptitudeScreen> createState() => _AIAptitudeScreenState();
}

class _AIAptitudeScreenState extends State<AIAptitudeScreen> {
  final TextEditingController questionController = TextEditingController();
  String aiAnswer = '';

  void getAIAnswer(String question) async {
    setState(() {
      aiAnswer = 'Thinking... (Gemini Flash)';
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      aiAnswer = 'Mock Answer from Gemini Flash for: "$question"';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Aptitude Assistant (Gemini Flash)')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: questionController,
              decoration: const InputDecoration(
                hintText: 'Ask an aptitude question...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => getAIAnswer(questionController.text),
              child: const Text('Ask AI'),
            ),
            const SizedBox(height: 20),
            const Text('AI Answer:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(aiAnswer),
          ],
        ),
      ),
    );
  }
}
