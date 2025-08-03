import 'package:flutter/material.dart';
import '../models/mission.dart';

class MissionTile extends StatelessWidget {
  final Mission mission;
  final VoidCallback onComplete;

  const MissionTile({super.key, required this.mission, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: mission.isCompleted ? Colors.green[100] : Colors.white,
      child: ListTile(
        title: Text(mission.name),
        trailing: IconButton(
          icon: const Icon(Icons.check_circle, color: Colors.green),
          onPressed: mission.isCompleted ? null : onComplete,
        ),
      ),
    );
  }
}
