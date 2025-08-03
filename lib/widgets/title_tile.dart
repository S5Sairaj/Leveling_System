import 'package:flutter/material.dart';
import '../models/title.dart';

class TitleTile extends StatelessWidget {
  final TitleModel title;

  const TitleTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${title.name} (Lv. ${title.level})'),
        leading: const Icon(Icons.workspace_premium_outlined, color: Colors.amber),
      ),
    );
  }
}
