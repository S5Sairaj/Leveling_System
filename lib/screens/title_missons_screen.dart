import 'package:flutter/material.dart';

class TitleMissionsScreen extends StatefulWidget {
  const TitleMissionsScreen({super.key});

  @override
  State<TitleMissionsScreen> createState() => _TitleMissionsScreenState();
}

class _TitleMissionsScreenState extends State<TitleMissionsScreen> {
  final List<String> titleMissions = [];
  final List<String> completedTitleMissions = [];
  final List<String> abilities = [];

  int titleLevel = 1;
  int titleExp = 0;
  final TextEditingController titleMissionController = TextEditingController();
  final TextEditingController abilityNameController = TextEditingController();

  void addTitleMission(String mission) {
    if (mission.isEmpty) return;
    setState(() {
      titleMissions.add(mission);
    });
    titleMissionController.clear();
  }

  void completeTitleMission(String mission) async {
    String ability = await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('New Ability Name'),
          content: TextField(
            controller: abilityNameController,
            decoration: const InputDecoration(hintText: 'Ability Name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, abilityNameController.text.trim()),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );

    if (ability.isEmpty) return;

    setState(() {
      titleMissions.remove(mission);
      completedTitleMissions.add(mission);
      abilities.add('Lv.$titleLevel - $ability');
      titleExp += 10;
      if (titleExp >= 50) {
        titleLevel++;
        titleExp = 0;
      }
    });
    abilityNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title Missions (Title EXP)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.purple, Colors.pink]),
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
                  Text('Title Level: $titleLevel',
                      style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('EXP: $titleExp / 50',
                      style: const TextStyle(fontSize: 16, color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: titleMissionController,
              decoration: InputDecoration(
                hintText: 'Add new title mission...',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onSubmitted: addTitleMission,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => addTitleMission(titleMissionController.text),
              child: const Text('Add Title Mission'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: titleMissions.map(
                  (mission) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      child: ListTile(
                        title: Text(mission),
                        trailing: IconButton(
                          icon: const Icon(Icons.check_circle, color: Colors.purple),
                          onPressed: () => completeTitleMission(mission),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            if (completedTitleMissions.isNotEmpty) ...[
              const Divider(height: 30),
              const Text(
                'Abilities Unlocked:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...abilities.map((ability) => ListTile(title: Text(ability))),
            ]
          ],
        ),
      ),
    );
  }
}
