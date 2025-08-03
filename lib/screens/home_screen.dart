import 'package:flutter/material.dart';
import '../models/mission.dart';
import '../models/title.dart';
import '../widgets/mission_tile.dart';
import '../widgets/title_tile.dart';
import '../widgets/level_info_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int level = 1;
  int exp = 0;

  final List<Mission> missions = [];
  final List<Mission> completedMissions = [];
  final List<TitleModel> titles = [TitleModel('Current S5')];

  final TextEditingController missionController = TextEditingController();

  void addMission(String missionName) {
    if (missionName.isEmpty) return;
    setState(() {
      missions.add(Mission(missionName));
    });
    missionController.clear();
  }

  void completeMission(Mission mission) {
    setState(() {
      mission.isCompleted = true;
      missions.remove(mission);
      completedMissions.add(mission);
      exp += 10;
      if (exp >= 50) {
        exp = 0;
        level++;
        titles.add(TitleModel('Title Rank Lv. $level'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leveling & Titles')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            LevelInfoCard(level: level, exp: exp),
            const SizedBox(height: 20),
            Text('Your Titles', style: Theme.of(context).textTheme.titleLarge),
            ...titles.map((title) => TitleTile(title: title)),
            const Divider(height: 30),
            Text('Missions', style: Theme.of(context).textTheme.titleLarge),
            ...missions.map((mission) => MissionTile(
                  mission: mission,
                  onComplete: () => completeMission(mission),
                )),
            const SizedBox(height: 10),
            TextField(
              controller: missionController,
              decoration: const InputDecoration(
                hintText: 'Add new mission...',
                border: OutlineInputBorder(),
              ),
              onSubmitted: addMission,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => addMission(missionController.text),
              child: const Text('Add Mission'),
            ),
          ],
        ),
      ),
    );
  }
}
