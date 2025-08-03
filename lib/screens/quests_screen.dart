import 'package:flutter/material.dart';

class QuestsScreen extends StatefulWidget {
  const QuestsScreen({super.key});

  @override
  State<QuestsScreen> createState() => _QuestsScreenState();
}

class _QuestsScreenState extends State<QuestsScreen> {
  final List<String> quests = [];
  final List<String> completedQuests = [];
  final TextEditingController questController = TextEditingController();

  int userLevel = 1;
  int userExp = 0;

  void addQuest(String quest) {
    if (quest.isEmpty) return;
    setState(() {
      quests.add(quest);
    });
    questController.clear();
  }

  void completeQuest(String quest) {
    setState(() {
      quests.remove(quest);
      completedQuests.add(quest);
      userExp += 10;
      if (userExp >= 50) {
        userLevel++;
        userExp = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Normal Missions (User EXP)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.indigo, Colors.deepPurple]),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text('Level: $userLevel',
                      style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('EXP: $userExp / 50',
                      style: const TextStyle(fontSize: 16, color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: questController,
              decoration: InputDecoration(
                hintText: 'Add a new quest...',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onSubmitted: addQuest,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => addQuest(questController.text),
              child: const Text('Add Mission'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: quests.map(
                  (quest) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      child: ListTile(
                        title: Text(quest),
                        trailing: IconButton(
                          icon: const Icon(Icons.check_circle, color: Colors.green),
                          onPressed: () => completeQuest(quest),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            if (completedQuests.isNotEmpty) ...[
              const Divider(height: 30),
              const Text(
                'Completed Missions:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...completedQuests.map((quest) => ListTile(title: Text(quest))),
            ]
          ],
        ),
      ),
    );
  }
}
